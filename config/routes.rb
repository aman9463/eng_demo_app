Rails.application.routes.draw do
	root to: 'home#index'
	resources :secret_codes, only:[:create, :destroy]
 scope module: :users do
  devise_for :users
end
end
