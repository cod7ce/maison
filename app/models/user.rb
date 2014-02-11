require "digest/md5"

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :realname, type: String
  field :crypted_password, type: String
  field :password_salt, type: String
  field :avatar_file_name, type: String
  field :github, type: String
  field :gmail, type: String
  field :homepage, type: String
  field :bio, type: String

  attr_accessor :password

  before_create :encrypt_password 

  has_many :posts
  has_many :gists
  
  def auth?
    if @auth_user ||= User.where(:email => self.email ).first
      if @auth_user.crypted_password == Digest::SHA2.hexdigest( self.password + @auth_user.password_salt)
        self.id = @auth_user.id
      else
        self.errors.add(:password)
      end
    else
      self.errors.add(:email)
    end
    self.errors.blank?
  end

  private
  def encrypt_password
    self.crypted_password = Digest::SHA2.hexdigest( self.password + self.password_salt ) unless self.password.blank?
  end
end
