# frozen_string_literal: true

module Mutations
  class CreateSubtaskMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false
    argument :task_id, ID, required: true

    type Types::SubtaskType

    def resolve(name:, description: nil, task_id:)
      check_authentication!

      task = Task.find(task_id)

      Subtask.create(name: name, description: description, task: task) if task
    end
  end
end
