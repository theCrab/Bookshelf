module Web::Views::Sessions
  class New
    include Web::View

    def signin_form
      form_for :signin, '/signin', class: 'uk-form' do
        div class: "uk-form-row" do
          div class: "uk-form-icon" do
            i class: "uk-icon-user"
            text_field :email, placeholder: "Email", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
          # p 'Dont use spaces.', class: 'uk-form-help-block uk-text-small uk-text-muted'
        end

        div class: "uk-form-row" do
          div class: "uk-form-icon" do
            i class: "uk-icon-lock"
            password_field :password, placeholder: "Password", required: '', class: 'uk-form-danger uk-form-large uk-form-width-large'
          end
        end

        div class: "uk-form-row" do
          div class: "uk-form-controls" do
            submit 'Signin', class: "uk-button uk-button-success uk-button-large uk-width-100"
          end
        end
      end
    end
  end
end
