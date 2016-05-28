require 'features_helper'

describe 'List books' do
  it 'should be successful' do
    visit '/books'
    
    assert_equal(page.status_code, 200, 'OK')
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      # assert page.has_content?('Kent Beck')
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
