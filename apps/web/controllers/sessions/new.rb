module Web::Controllers::Sessions
  class New
    include Web::Action
    include Authentication::Skip

    def call(params)
    end
  end
end
