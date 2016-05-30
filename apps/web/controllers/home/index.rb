module Web::Controllers::Home
  class Index
    include Web::Action
    include Authentication::Skip

    def call(params)
    end
  end
end
