FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'hello@example.com' }
    password { 'password' }
  end
end
