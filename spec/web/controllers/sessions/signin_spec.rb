require 'spec_helper'
require_relative '../../../../apps/web/controllers/sessions/signin'

describe Web::Controllers::Sessions::Signin do
  let(:signin_form) { { username: 'saara@crab.com', password: 'secret'} }
  let(:action) { Web::Controllers::Sessions::Signin.new }
  let(:params) { Hash[signin: signin_form] }

  before do
    UserRepository.clear
    UserRepository.create(User.new(email: 'saara@crab.com', password: 'secret'))
  end

  it 'is successful' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_match(/\/users\/\d+/)
    # puts response[1]
  end

  it 'sets the auth_token in session and header' do
    response = action.call(params)

    # response[1]['auth_token'].wont_be_nil
    response[1]['Authentication'].wont_be_nil
  end
end
