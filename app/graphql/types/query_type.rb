# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :current_user, resolver: Resolvers::CurrentUserResolver

    field :projects, resolver: Resolvers::ProjectsResolver
    field :project, resolver: Resolvers::ProjectResolver

    field :tasks, resolver: Resolvers::TasksResolver
    field :task, resolver: Resolvers::TaskResolver

    field :subtasks, resolver: Resolvers::SubtasksResolver
    field :subtask, resolver: Resolvers::SubtaskResolver
  end
end
