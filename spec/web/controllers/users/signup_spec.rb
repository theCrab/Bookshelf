require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/signup'

describe Web::Controllers::Users::Signup do
  let(:action) { Web::Controllers::Users::Signup.new }
  # let(:params) { Hash[] }
  after do
    UserRepository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[user: { email: 'the@crab.com', password: 'super-secret' }] }

    it 'is successful' do
      response = action.call(params)
      action.user.id.wont_be_nil
    end
  end
end
