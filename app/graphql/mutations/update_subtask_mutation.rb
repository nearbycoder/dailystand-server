# frozen_string_literal: true

module Mutations
  class UpdateSubtaskMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: false
    argument :task_id, ID, required: false
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false

    type Types::SubtaskType

    def resolve(id:, **args)
      check_authentication!

      subtask = Subtask.find(id)

      if subtask
        subtask.update(**args)
        subtask
      end
    end
  end
end
