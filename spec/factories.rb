FactoryGirl.define do
  factory :post do
    user
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph }
  end
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end