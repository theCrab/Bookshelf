require_relative 'fumikiri'

module Authentication
  module Skip
		private
		def authenticate!
			 # no-op implementation
		end
	end

	def self.included(action)
		action.class_eval do
			before :authenticate!
			expose :current_user
		end
	end

  private
  def authenticate!
    redirect_to '/signin' unless authenticated?
  end

  def authenticated?
    ! current_user.nil?
  end

  def current_user
    return @current_user = nil if token_payload.nil? || token_payload.size == 0
    @current_user = UserRepository.find(decoded_token[0]['sub'])
  end

  def token_payload
    request.env.fetch('Authentication', '').sub(/Bearer\s/, '')
  end

  def decoded_token
    Fumikiri.new({ data: token_payload, dothis: 'verify' }).call
  end

  def refresh_token
    # Rethink this function for security
    if decoded_token[0]['exp'].to_i > Time.now.to_i
      Fumikiri.new({ data: { sub: current_user.id, exp: Time.now + 800407, iss: 'thecrab.com', aud: current_user.role, jti: decoded_token[0][:jti] }, dothis: 'issue' }).call
    end
  end
end
