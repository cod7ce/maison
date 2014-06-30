FactoryGirl.define do
  factory :user, :class => 'User' do
    sequence(:name){|n| "name#{n}" }
    sequence(:email){|n| "email#{n}@zhifangzi.com" }
    password 'password'
    password_salt 'sqlt'
  end

  factory :category do
    sequence(:code) { |n| "code#{n}" }
    sequence(:name) { |n| "name#{n}" }
  end

  factory :post do
    sequence(:title) { |n| "title#{n}" }
    sequence(:summary) { |n| "summary#{n}" }
    sequence(:alias) { |n| "alias#{n}" }
    tags ['tag1', 'tag2', 'tag3']
    content "post content"
    category
    user
  end

  factory :gist do
    sequence(:title) { |n| "title#{n}" }
    sequence(:summary) { |n| "summary#{n}" }
    sequence(:alias) { |n| "alias#{n}" }
    tags ['tag1', 'tag2', 'tag3']
    user
  end

  factory :snippet do
    sequence(:filename) { |n| "filename#{n}.rb" }
    sequence(:code) { |n| "code#{n}" }
    language 'ruby'
    gist
  end
end
