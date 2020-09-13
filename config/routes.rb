Rails.application.routes.draw do

  root 'home#top'
	get 'about' => 'home#about'
  get 'end_users/end_users/edit' => 'end_users#edit'

	devise_for :end_users, skip: :all

  devise_scope :end_user do
    get 'end_users/sign_up', to: 'end_users/registrations#new', as: :new_end_user_registration
    post 'end_users/sign_up', to: 'end_users/registrations#create', as: :end_user_registration
    post 'end_users/registration', to: 'end_users/registrations#edit'
    patch 'end_users/registration', to: 'end_users/registrations#update'
    put 'end_users/registration', to: 'end_users/registrations#update'
    delete 'end_users/registration', to: 'end_users/registrations#destroy'
    get 'end_users/sign_in', to: 'end_users/sessions#new', as: :new_end_user_session
    post 'end_users/sign_in', to: 'end_users/sessions#create', as: :end_user_session
    delete 'end_users/sign_out', to: 'end_users/sessions#destroy', as: :destroy_end_user_session
    get 'end_users/password/new', to: 'end_users/passwords#new', as: :new_end_user_password
    post 'end_users/password', to: 'end_users/passwords#create'
    get 'end_users/password/edit', to: 'end_users/passwords#edit', as: :edit_end_user_password
    patch 'end_users/password', to: 'end_users/passwords#update'
    put 'end_users/password', to: 'end_users/passwords#update'

  end

  resources :genres, only: [:show]
	resources :items, only: [:index, :show]

  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :create, :destroy, :update]
  resources :genres, only: [:show]
	resources :deliveries, except: [:new, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
	resources :orders, only: [:index, :show, :new, :create]

	post 'orders/confirm' => 'orders#confirm'
	get 'orders/thanks' => 'orders#thanks'
	resource :end_users, only: [:show, :update]
  get 'end_users/end_users/password_edit' => 'end_users#password_edit'
  put 'end_users/end_users/password_edit' => 'end_users#password_update'

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
    resources :orders, only: [:index, :show, :update]
    get 'end_user_index/:id' => 'orders#end_user_index'
    resources :order_details, only: [:update]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

