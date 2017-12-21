FactoryBot.define do
  factory :task do
    name { Faker::Lorem.sentence }
    project { build :project }
  end
end
