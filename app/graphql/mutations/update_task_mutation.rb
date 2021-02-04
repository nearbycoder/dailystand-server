# frozen_string_literal: true

module Mutations
  class UpdateTaskMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: false
    argument :project_id, ID, required: false
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false

    type Types::TaskType

    def resolve(id:, **args)
      check_authentication!

      task = Task.find(id)

      if task
        task.update(args)
        task
      end
    end
  end
end
