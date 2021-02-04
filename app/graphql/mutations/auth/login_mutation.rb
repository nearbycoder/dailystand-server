# frozen_string_literal: true

module Mutations
  module Auth
    class LoginMutation < Mutations::Auth::BaseAuthMutation
      argument :email, String, required: true
      argument :password, String, required: true

      type Types::Auth::TokenType

      def resolve(email:, password:)
        @user = User.find_by(email: email)

        if @user&.authenticate(password)
        { user: @user, token: token }
        else
          { user: nil, token: nil, errors: [{field: 'email or password', message: 'does not match' }] }
        end
      end

      private

      def token
        ::TokenService.encode(user_id: @user.id, email: @user.email)
      end
    end
  end
end
