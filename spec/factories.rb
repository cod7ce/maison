FactoryGirl.define do
  factory :user, :class => 'User' do
    sequence(:name){|n| "name#{n}" }
    sequence(:email){|n| "email#{n}@zhifangzi.com" }
    password 'password'
    password_salt 'sqlt'
  end
end
