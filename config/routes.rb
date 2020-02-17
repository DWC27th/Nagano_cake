Rails.application.routes.draw do

  devise_for :members

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: :new_admin_session
    post 'admins/sign_in' => 'admins/sessions#create', as: :admin_session
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: :destroy_admin_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :members do
    resources :members, only: [:edit, :update, :show, :destroy]
    get 'cart_items' => 'cart_items#index', as: 'cart_items'

  	resources :cart_items, only: [:index, :create, :update, :destroy]
  	resource :cart_items, only: [:destroy]
    get 'orders/complete' => 'orders#complete', as: 'order_complete'
  	resources :orders, only: [:index, :new, :create, :show]
  	resources :shop_items, only: [:index, :show]
  	resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
    get 'orders/new/confirm' => 'orders#confirm', as: 'order_confirm'
    get 'top' => 'shop_items#top', as: 'top'
    get 'about' => 'shop_items#about', as: 'about'
    get 'members/:id/edit/cancel' => 'members#cancel', as: 'cancel'
    put 'members/:id' => 'members#withdraw', as: 'withdraw_put'
    patch 'members/:id' => 'members#withdraw', as: 'withdraw_patch'
  end

    root 'members/shop_items#top'

  namespace :admins do
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update]
  	resources :shop_items, only: [:index, :new, :create, :show, :edit, :update]
  	resources :genres, only: [:index, :create, :edit, :update]
    get 'top' => 'orders#top', as: 'top'
  end

end