# frozen_string_literal: true

module Mutations
  module Auth
    class RegisterMutation < Mutations::Auth::BaseAuthMutation
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::Auth::TokenType

      def resolve(args)
        @user = User.create(args)

        if @user.persisted?
          { user: @user, token: token }
        else
          { user: nil, token: nil, errors: errors(@user) }
        end
      end

      private

      def token
        ::TokenService.encode(user_id: @user.id, email: @user.email)
      end
    end
  end
end
