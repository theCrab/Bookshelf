require 'spec_helper'

describe Book do
  it 'can be initialised without attributes' do
    book = Book.new
    book.must_respond_to(:id)
    book.must_respond_to(:title)
    book.must_respond_to(:author)
    book.must_respond_to(:updated_at)
    book.must_respond_to(:created_at)
  end

  it 'can be initialised with attributes' do
    book = Book.new(title: 'Refactoring')
    book.title.must_equal('Refactoring')
    book.title.wont_be_nil
    book.id.must_be_nil
  end
end
