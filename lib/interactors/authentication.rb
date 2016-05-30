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
    # @current_user = UserRepository.find(id: decoded_token[0]['sub'])
    true
  end

  def token_payload
    token_in_header  = request.env['Authentication']

    # redirect_to '/' unless token_in_header
    # token_in_session = sessions['auth_token']

    # token_in_session ? token_in_session : token_in_header.sub(/Bearer\s/, '')
    token_in_header ? token_in_header.sub(/Bearer\s/, '') : 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0ZXN0IjoiZGF0YSJ9._sLPAGP-IXgho8BkMGQ86N2mah7vDyn0L5hOR4UkfoI'
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
