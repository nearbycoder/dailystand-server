# frozen_string_literal: true

module Resolvers
  class ProjectsResolver < Resolvers::Base
    type Types::ProjectType.connection_type, null: false

    def resolve
      current_user&.projects
    end
  end
end
