# frozen_string_literal: true

module Resolvers
  class SubtaskResolver < Resolvers::Base
    type Types::SubtaskType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Subtask.includes(:task).where(id: id, 'tasks.user_id': current_user.id).first
    end
  end
end
