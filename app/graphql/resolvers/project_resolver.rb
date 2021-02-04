# frozen_string_literal: true

module Resolvers
  class ProjectResolver < Resolvers::Base
    type Types::ProjectType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Project.where(id: id, user: current_user).first
    end
  end
end
