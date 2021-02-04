# frozen_string_literal: true

module Types
  class ErrorType < Types::BaseObject
    description 'A readable error'

    field :message, String, null: false,
                            description: 'A description of the error'
    field :field, String, null: true,
                          description: 'Which input value this error came from'
  end
end
