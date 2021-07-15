Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == '1' }
  end

  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == '2' }
  end

  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show, :create]
    resource :phone, only: [:update, :create, :destroy]
    resource :phones, only: [:show, :create], path: 'relationships/phones'
    resource :phone, only: [:update, :create, :destroy], path: 'relationships/phones'

    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
