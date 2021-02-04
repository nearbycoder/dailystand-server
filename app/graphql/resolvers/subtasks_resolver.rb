# frozen_string_literal: true

module Resolvers
  class SubtasksResolver < Resolvers::Base
    type Types::SubtaskType.connection_type, null: false

    def resolve
      current_user&.subtasks
    end
  end
end
