Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == '1' }
  end

  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == '2' }
  end

  resources :kinds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
