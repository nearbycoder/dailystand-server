# frozen_string_literal: true

module Mutations
  class CreateTaskMutation < Mutations::BaseMutation
    argument :name, String, required: true
    argument :description, String, required: false
    argument :project_id, ID, required: true

    type Types::TaskType

    def resolve(name:, description: nil, project_id:)
      check_authentication!

      project = Project.find(project_id)

      if project
        Task.create(name: name, description: description, user: current_user, project: project)
      end
    end
  end
end
