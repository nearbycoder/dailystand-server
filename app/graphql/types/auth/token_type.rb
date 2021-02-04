# frozen_string_literal: true

module Types
  module Auth
    class TokenType < Types::BaseObject
      field :user, Types::UserType, null: true
      field :token, String, null: true
      field :errors, [Types::ErrorType], null: true
    end
  end
end
