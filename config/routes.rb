Bragi::Application.routes.draw do
  get 'log_in' => "author/sessions#new", :as => 'log_in'
  namespace :admin do
    resources :posts
  end
  namespace :author do
    resources :sessions
  end 
  resources :posts,:only => ["index", "show"]
  root :to => "posts#index"
end
