# frozen_string_literal: true

module Mutations
  module Auth
    class BaseAuthMutation < GraphQL::Schema::RelayClassicMutation
      argument_class Types::BaseArgument
      field_class Types::BaseField
      input_object_class Types::BaseInputObject
      object_class Types::BaseObject

      def errors(model)
        model.errors.map do |attribute, message|
          {
            field: attribute.to_s.camelize(:lower),
            message: message
          }
        end
      end
    end
  end
end
