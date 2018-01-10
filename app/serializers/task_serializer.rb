class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :done, :deadline, :created_at, :project_id
end
