Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'urls#new'

  resources :urls, only: [:index, :new, :show, :create]
  get '/:id', to: "urls#show"
end
