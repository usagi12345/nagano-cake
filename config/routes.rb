Rails.application.routes.draw do
  
  root 'home#top'
	get 'about' => 'home#about'

	devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  resources :genres, only: [:show]
	resources :items, only: [:index, :show] do
    resources :cart_items, only: [:index, :create, :destroy, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  resources :genres, only: [:show]
	resources :deliveries, except: [:new, :show]
	resources :orders, only: [:index, :show, :new, :create]
	post 'orders/confirm' => 'orders#confirm'
	get 'orders/thanks' => 'orders#thanks'
	resource :end_users, only: [:show, :edit, :update]
	get 'end_users/withdraw' => 'end_users#withdraw'
	patch 'end_users/out' => 'end_users#out'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    root 'home#top'
    resources :items, except: [:destroy]
    resources :orders, only: [:index, :show, :update] do
      resources :order_details, only: [:update]
    end
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

