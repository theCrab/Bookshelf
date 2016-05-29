module Web::Views::Books
  class New
    include Web::View

    def book_form
      form_for :book, '/books', class: 'uk-form' do
        div class: "uk-form-row" do
          div class: "uk-form-list" do
            i class: "uk-icon-user"
            text_field :title, placeholder: "Title", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
          p 'Title of book.', class: 'uk-form-help-block uk-text-small uk-text-muted'
        end

        div class: "uk-form-row" do
          div class: "uk-form-icon" do
            i class: "uk-icon-user"
            text_field :author, placeholder: "Author", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
          p 'Name of author.', class: 'uk-form-help-block uk-text-small uk-text-muted'
        end

        div class: "uk-form-row" do
          div class: "uk-form-controls" do
            submit 'Create Book', class: "uk-button uk-button-success uk-button-large uk-width-100"
          end
        end
      end
    end

  end
end
