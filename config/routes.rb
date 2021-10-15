Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :urls, only: [:index, :new, :show, :create], path: '/' do
    member do
      get :info
    end
  end
end
