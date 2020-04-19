Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  get "/about" => "pages#about"
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :posts do
    resources :comments
  end



  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts
    end
  end  

  
end
