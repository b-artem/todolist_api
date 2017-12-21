FactoryBot.define do
  factory :project do
    name { Faker::Lorem.sentence }
    user { build :user }
  end
end
