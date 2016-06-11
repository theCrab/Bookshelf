require 'bcrypt'

module Web::Controllers::Sessions
  class Signin
    include Web::Action
    include Authentication::Skip

    params do
      param :signin do
        param :username, presence: true
        param :password, presence: true
      end
    end

    def call(params)
      if params.valid?
        authenticate_user
        self.headers.merge!({ 'Authentication' => "Bearer #{@token.result}" })
        self.session[:auth_token] = @token.result

        redirect_to "/users/#{user.id}"
      end
    end

    private
    def login_username
      params.get('signin.username').strip.downcase.gsub(/\s+/, '')
    end

    def login_password
      params.get('signin.password')
    end

    def user
      UserRepository.find_by_email(login_username)
    end

    def valid_password?
      BCrypt::Password.new(user.password_hash) == login_password
    end

    def authenticate_user
      if !user.nil? && valid_password?
        payload = { data: { sub: user.id, iat: Time.now.to_i, exp: Time.now.to_i + 800407, aud: 'role:admin' }, dothis: 'issue' }
        @token = Fumikiri.new(payload).call
      end
    end
  end
end
