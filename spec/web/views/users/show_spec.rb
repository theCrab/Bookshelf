require 'spec_helper'
require_relative '../../../../apps/web/views/users/show'

describe Web::Views::Users::Show do
  let(:exposures) { Hash[user: {}] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/show.html.erb') }
  let(:view)      { Web::Views::Users::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #user' do
    view.user.must_equal exposures.fetch(:user)
  end

  describe 'when the user is revoked' do
    let(:banned_user) { User.new(email: 'saara@crab.com', password: 'secret', revoked: true) }
    let(:exposures) { Hash[user: banned_user] }

    it 'hides the sensitive data' do
      rendered.wont_include('Admins Only')
    end
  end

  describe 'when the user is revoked' do
    let(:normal_user) { User.new(email: 'saara@crab.com', password: 'secret') }
    let(:exposures) { Hash[user: normal_user] }

    it 'hides the sensitive data' do
      rendered.must_include('Admins Only')
    end
  end
end
