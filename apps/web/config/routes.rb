# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage

get '/',          to: 'home#index'
get '/books',     to: 'books#index'
get '/books/new', to: 'books#new'
post '/books',    to: 'books#create'

get '/signup',    to: 'users#new'
post '/signup',   to: 'users#signup'
get '/users/:id', to: 'users#show'

get '/signin',    to: 'sessions#new'
post '/signin',   to: 'sessions#signin'
