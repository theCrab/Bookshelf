require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/create'

describe Web::Controllers::Books::Create do
  let(:action) { Web::Controllers::Books::Create.new }
  # let(:params) { Hash[book: { title: 'The Concubines', author: 'Nicholai Gogol' }] }

  before do
    BookRepository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[book: { title: 'The Concubines', author: 'Nicholai Gogol' }] }

    it 'creates a new book' do
      action.call(params)
      action.book.id.wont_be_nil
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      response[0].must_equal(302)
      response[1]['Location'].must_equal('/books')
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[book: {}] }

    it 're-renders the book#new view' do
      response = action.call(params)
      response[0].must_equal(200)
    end

    it 'sets errors attribute accordingly' do
      action.call(params)

      refute action.params.valid?

      # action.errors.for('book.title').wont_be_empty
      # action.errors.for('book.author').wont_be_empty
    end
  end
end
