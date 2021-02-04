# frozen_string_literal: true

module Mutations
  class DeleteProjectMutation < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::ProjectType

    def resolve(id:)
      check_authentication!

      project = Project.find(id)

      project if project.destroy
    end
  end
end
