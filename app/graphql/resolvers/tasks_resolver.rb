# frozen_string_literal: true

module Resolvers
  class TasksResolver < Resolvers::Base
    type Types::TaskType.connection_type, null: false

    def resolve
      current_user&.tasks
    end
  end
end
