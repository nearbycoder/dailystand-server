# frozen_string_literal: true

module Types
  class SubtaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :task, Types::TaskType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :completed_at, GraphQL::Types::ISO8601DateTime, null: false

    def task
      RecordLoader.for(Task).load(object.task_id)
    end
  end
end
