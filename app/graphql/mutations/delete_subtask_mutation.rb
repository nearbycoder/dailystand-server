# frozen_string_literal: true

module Mutations
  class DeleteSubtaskMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::SubtaskType

    def resolve(id:)
      check_authentication!

      subtask = Subtask.find(id)

      subtask if subtask.destroy
    end
  end
end
