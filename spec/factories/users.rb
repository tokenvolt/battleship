FactoryGirl.define do
  factory :user do
    nick_name { Faker::Name.first_name }
    email     { Faker::Internet.email + rand(1..1000).to_s }
    password  'password'
  end
end
