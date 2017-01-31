Rails.application.routes.draw do

	resources :charges, only: [:create, :new]
	post 'charges/down_grade' => 'charges#down_grade'

  resources :wikis
  
  devise_for :users
	resources :users, only: [:edit, :update, :show]

	get 'index' => 'welcome#index'
  get 'about' => 'welcome#about'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
