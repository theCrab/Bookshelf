require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/show'

describe Web::Controllers::Users::Show do
  let(:action) { Web::Controllers::Users::Show.new }
  let(:params) { Hash[] }

  it 'is redirected to signin' do
    response = action.call(params)
    response[0].must_equal 302
    response[1]['Location'].must_equal '/signin'
  end
end
