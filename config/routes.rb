Rails.application.routes.draw do
# 顧客用
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    patch '/items/:id' => 'items#update'
    resources :items
    resources :customers, only: [:index ,:show ,:edit]
    resources :orders, only: [:show]
    get '/homes/top' => 'homes#top', as: 'homes_top'
  end
  
  scope module: :public do
    resources :items, only: [:index, :show]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    resources :cart_items
    resources :orders, only: [:index, :show, :new, :create]
    get '/top' => 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/update' => 'customers#update'
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/destroy' => 'customers#withdraw'
    
  end

end
