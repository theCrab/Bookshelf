module Web::Controllers::Books
  class New
    include Web::Action
    include Authentication::Skip

    def call(params)
    end
  end
end
