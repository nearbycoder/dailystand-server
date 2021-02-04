# frozen_string_literal: true

module Mutations
  class UpdateProjectMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(id:, name:, description: nil)
      check_authentication!

      project = Project.find(id)

      if project.user == current_user
        project.update(name: name, description: description, user: current_user)
        project
      end
    end
  end
end
