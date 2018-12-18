Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#login'

  get '/users/signup' => 'users#signup'
  post '/users/register_user' => 'users#register_user'
  post '/users/signin' => 'users#signin'
  post '/accounts/create_transaction' => 'accounts#create_transaction'
  post '/users/update' => 'users#update'
  get '/accounts/transactions' => 'accounts#transactions'
  get '/users/login' => 'users#login'
  get '/users/signout' => 'users#signout'
  get '/users/edit' => 'users#edit'
  get '/accounts/dashboard' => 'accounts#dashboard'
end
