module Web::Controllers::Books
  class Index
    include Web::Action
    include Authentication::Skip
    expose :books

    def call(params)
      @books = BookRepository.all
    end
  end
end
