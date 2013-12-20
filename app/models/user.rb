class User
  include Mongoid::Document
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

  has_many :posts
end
