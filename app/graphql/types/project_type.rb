# frozen_string_literal: true

module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :user, Types::UserType, null: false
    field :tasks, Types::TaskType.connection_type, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def user
      RecordLoader.for(User).load(object.user_id)
    end

    def tasks
      AssociationLoader.for(object.class, :tasks).load(object)
    end
  end
end
