# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Auth::LoginMutation
    field :register, mutation: Mutations::Auth::RegisterMutation

    field :create_project, mutation: Mutations::CreateProjectMutation
    field :update_project, mutation: Mutations::UpdateProjectMutation
    field :delete_project, mutation: Mutations::DeleteProjectMutation

    field :create_task, mutation: Mutations::CreateTaskMutation
    field :update_task, mutation: Mutations::UpdateTaskMutation
    field :delete_task, mutation: Mutations::DeleteTaskMutation

    field :create_subtask, mutation: Mutations::CreateSubtaskMutation
    field :update_subtask, mutation: Mutations::UpdateSubtaskMutation
    field :delete_subtask, mutation: Mutations::DeleteSubtaskMutation
  end
end
