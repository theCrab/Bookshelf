require 'features_helper'

describe 'Books' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book record' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'book[title]', with: 'The River and The Source'
      fill_in 'book[author]', with: 'Margaret Ogola'

      click_button 'Create Book'
    end

    current_path.must_equal('/books')
    assert page.has_content?('The River and The Source')
  end
end
