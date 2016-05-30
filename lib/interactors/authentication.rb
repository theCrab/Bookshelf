# require 'jwt'

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
    token_in_header  = request.env.fetch('Authentication')
    token_in_session = session['auth_token']

    token_in_session ? token_in_session : token_in_header.sub(/Bearer\s/, '')
  end

  def decoded_token
    Fumikiri.verify({ data: token_payload, dothis: 'verify' })
  end

  def refresh_token
    # Rethink this function for security
    if decoded_token[0]['exp'].to_i > Time.now.to_i
      Fumikiri.issue({ data: { sub: current_user.id, exp: Time.now + 800407, iss: 'thecrab.com', aud: current_user.role, jti: decoded_token[0][:jti] }, dothis: 'issue' })
    end
  end
end
