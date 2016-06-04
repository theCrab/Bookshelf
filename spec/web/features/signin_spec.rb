require 'features_helper'

describe 'Signin' do

  before do
    UserRepository.new.clear

    UserRepository.new.create(User.new(email: 'saara@crab.com', password: 'secret'))
  end

  it 'should be success' do
    visit '/signin'

    within '#signin-form' do
      fill_in 'signin[username]', with: 'saara@crab.com'
      fill_in 'signin[password]', with: 'secret'

      click_button 'Signin'
    end

    current_path.must_equal('/')
    page.status_code.must_equal(200)
  end
end
