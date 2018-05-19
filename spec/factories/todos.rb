FactoryBot.define do
  factory :todo do 
    title { Faker::Number.number(10) }
    created_by { Faker::Number.number(10) }
  end
end
