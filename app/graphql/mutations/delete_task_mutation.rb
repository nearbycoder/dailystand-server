# frozen_string_literal: true

module Mutations
  class DeleteTaskMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(id:)
      check_authentication!

      task = Task.find(id)

      task if task.destroy
    end
  end
end
