Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions:"admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    patch "/order_details/:id" => "order_details#update", as:"update"
  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as:"about"
    resources :items, only:[:index, :show, :create, :new, :edit, :update]
    get "/customers" => "customers#show", as:"show"
    get "/customers/information/edit" => "customers#edit", as:"edit"
    get "/customers/confirm" => "customers#confirm", as:"confirm"
    patch "/customers/information" => "customers#update", as:"update"
    patch "/customers/unsubscribe" => "customers#unsubscribe", as:"unsubscribe"
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as:"destroy_all"
    resources :cart_items, only:[:index, :update, :create, :destroy]
    get "/orders/complete" => "orders#complete", as:"complete"
    resources :orders, only:[:new, :create, :index, :show]
    post "/orders/confirm" => "orders#confirm", as:"order_confirm"
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
