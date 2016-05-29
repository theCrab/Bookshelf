module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    def call(params)
      @book = BookRepository.create(Book.new(params[:book]))

      redirect_to '/books'
    end
  end
end
