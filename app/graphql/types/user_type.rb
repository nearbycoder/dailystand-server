# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :projects, Types::ProjectType.connection_type, null: false
    field :tasks, Types::ProjectType.connection_type, null: false
    field :subtasks, Types::ProjectType.connection_type, null: false

    def projects
      AssociationLoader.for(object.class, :projects).load(object)
    end

    def tasks
      AssociationLoader.for(object.class, :tasks).load(object)
    end

    def subtasks
      AssociationLoader.for(object.class, :subtasks).load(object)
    end
  end
end
