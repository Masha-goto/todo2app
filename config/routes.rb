Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root to: 'tasks#index'

	resources :tasks

	resource :profile, only: [:show, :edit, :update]

	resources :cards do
		resources :comments, only: [:new, :create]
	end
end
