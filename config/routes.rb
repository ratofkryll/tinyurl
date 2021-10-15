Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'urls#new'

  resources :urls, only: [:index, :new, :show, :create] do
    member do
      get :info
    end
  end
  get '/:id', to: "urls#show", as: :short
  get '/:id/info', to: "urls#info", as: :info
end
