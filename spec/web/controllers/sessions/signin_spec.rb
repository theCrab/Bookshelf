require 'spec_helper'
require_relative '../../../../apps/web/controllers/sessions/signin'

describe Web::Controllers::Sessions::Signin do
  let(:action) { Web::Controllers::Sessions::Signin.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
