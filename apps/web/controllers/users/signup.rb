module Web::Controllers::Users
  class Signup
    include Web::Action
    include Authentication::Skip
    expose :user

    params do
      param :user do
        param :email,    presence: true
        # param :username, presence: true
        param :password, presence: true
      end
    end

    def call(params)
      if params.valid?
        @user = UserRepository.new.create(User.new(params[:user]))
        redirect_to '/'
      end
    end

    private
    def create_user
    end
  end
end
