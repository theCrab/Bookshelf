require 'features_helper'

describe 'Signup' do
  after do
    UserRepository.new.clear
  end

  it 'should be successful' do
    visit '/signup'

    assert_equal(page.status_code, 200, 'OK')
    current_path.must_equal('/signup')
  end

  describe 'With valid attributes,' do
    it 'creates a new user' do
      visit '/signup'

      within '#user-form' do
        fill_in 'user[email]',    with: 'the@crab.com'
        fill_in 'user[username]', with: 'theCrab'
        fill_in 'user[password]', with: 'super-secret'

        click_button 'Signup to Bookshelf'
      end

      current_path.must_equal('/')
      assert(page.status_code, 301)
    end
  end
end
