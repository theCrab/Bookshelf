require 'hanami/interactor'
require 'jwt'

class Fumikiri
  include Hanami::Interactor
  expose :result

  def initialize(payload = {})
    @payload = payload
    @result
  end

  def call
    @result = case @payload[:dothis]
    when 'verify'
      verify
    when 'issue'
      issue
    end
  end

  private
  def verify
    JWT.decode(@payload[:data], ENV['JWT_SECRET'], true, { verify_iat: true, iat: true, verify_aud: true, aud: 'admin' })
  end

  def issue
    JWT.encode(@payload[:data], ENV['JWT_SECRET'], 'HS256')
  end

end
