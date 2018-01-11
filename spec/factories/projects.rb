FactoryBot.define do
  factory :project do
    name { Faker::Lorem.sentence }
    user

    # factory :project_with_tasks do
    #   transient do
    #     task_count 1
    #   end
    #   after(:create) do |project, evaluator|
    #     evaluator.task_count.times do
    #       create :task, project: project
    #     end
    #   end
    # end
  end
end
