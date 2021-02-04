# frozen_string_literal: true

module TokenService
  def self.encode(payload)
    exp = Time.now.to_i + 12 * 3600
    JWT.encode({ **payload, exp: exp }, ENV['JWT_SECRET'], 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')[0]
  rescue StandardError
    nil
  end
end
