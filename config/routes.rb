Bragi::Application.routes.draw do
  get 'log_in' => "author/sessions#new", :as => 'log_in'

  namespace :author do
    resources :sessions
    resources :posts
  end 

  resources :posts,:only => ["index", "show"]
  root :to => "posts#index"
end
