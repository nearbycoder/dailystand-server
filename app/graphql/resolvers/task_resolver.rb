# frozen_string_literal: true

module Resolvers
  class TaskResolver < Resolvers::Base
    type Types::TaskType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Task.where(id: id, user: current_user).first
    end
  end
end
