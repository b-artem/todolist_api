FactoryBot.define do
  factory :task do
    name "MyString"
    deadline "2017-12-13 17:02:10"
    priority 1
    done false
    project nil
  end
end
