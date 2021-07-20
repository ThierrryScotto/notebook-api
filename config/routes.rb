Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :contacts
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :contacts
  end

  resources :kinds
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
