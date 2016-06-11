require 'features_helper'

describe 'Signin' do

  before do
    UserRepository.clear

    @user = UserRepository.create(User.new(email: 'saara@crab.com', password: 'secret'))
  end

  it 'should be success' do
    visit '/signin'

    within '#signin-form' do
      fill_in 'signin[username]', with: 'saara@crab.com'
      fill_in 'signin[password]', with: 'secret'

      click_button 'Signin'
    end

    current_path.must_equal("/users/#{@user.id}")
    page.status_code.must_equal(200)
    page.body.must_include(@user.email)
  end
end
