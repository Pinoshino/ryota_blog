Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments, :only => [:create, :destroy]
  end
  root 'articles#index'
end
