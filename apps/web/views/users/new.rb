module Web::Views::Users
  class New
    include Web::View

    def signup_form
      form_for :user, '/signup', class: 'uk-form' do
        div class: "uk-form-row" do
          div class: "uk-form-list" do
            i class: "uk-icon-at"
            email_field :email, placeholder: "Email", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
          p 'Email.', class: 'uk-form-help-block uk-text-small uk-text-muted'
        end

        div class: "uk-form-row" do
          div class: "uk-form-list" do
            i class: "uk-icon-user"
            text_field :username, placeholder: "Username", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
          p 'Between 6-15 characters.', class: 'uk-form-help-block uk-text-small uk-text-muted'
        end

        div class: "uk-form-row" do
          div class: "uk-form-list" do
            i class: "uk-icon-lock"
            password_field :password, placeholder: "Choose a password", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
          p 'At least 6 characterss, at least 1 none alphanumeric character.', class: 'uk-form-help-block uk-text-small uk-text-muted'
        end

        div class: "uk-form-row" do
          div class: "uk-form-controls" do
            submit 'Signup to Bookshelf', class: "uk-button uk-button-success uk-button-large uk-width-100"
          end
        end
      end
    end
  end
end
