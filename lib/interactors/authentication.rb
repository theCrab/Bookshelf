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
    redirect_to '/signin' if authenticated?
  end

  def authenticated?
    current_user.nil?
  end

  def current_user
    return nil unless token_payload
    @current_user = UserRepository.find(decoded_token.result[0]['sub'])
  end

  def token_payload
    # token_in_header  = request.env['Authentication'] &&
    request.env['Authentication'] #
    # token_in_session = request.env['auth_token']
    # token_in_header ? token_in_header : token_in_session
  end

  def decoded_token
    Fumikiri.new({ data: token_payload.sub(/Bearer\s/, ''), dothis: 'verify' }).call
  end

  def refresh_token
    # Rethink this function for security
    if decoded_token[0]['exp'].to_i > Time.now.to_i
      Fumikiri.new({ data: { sub: current_user.id, exp: Time.now + 800407, iss: 'thecrab.com', aud: 'role:admin' }, dothis: 'issue' }).call
    end
  end
end
