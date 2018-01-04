class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :done, :created_at, :project_id
end
