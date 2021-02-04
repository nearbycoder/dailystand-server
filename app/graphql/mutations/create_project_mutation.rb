# frozen_string_literal: true

module Mutations
  class CreateProjectMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false

    type Types::ProjectType

    def resolve(name:, description: nil)
      check_authentication!
      Project.create(name: name, description: description, user: current_user)
    end
  end
end
