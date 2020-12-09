FactoryBot.define do
  factory :user do
    username { Faker::Twitter.screen_name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end
