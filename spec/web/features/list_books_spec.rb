require 'features_helper'

describe 'List books' do
  before do
    BookRepository.new.clear
    UserRepository.new.clear

    BookRepository.new.create(Book.new(title: 'Siku Njema', author: 'Ken Walibora'))
    BookRepository.new.create(Book.new(title: '1984', author: 'George Orwell'))
    UserRepository.new.create(User.new(email: 'hello@why.com', password: 'secret'))

    auth_as('hello@why.com', 'secret')
  end

  it 'should be successful' do
    visit '/books'

    assert_equal(page.status_code, 200, 'OK')
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
