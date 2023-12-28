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
    resources :items, only: [:index]
    get 'homes/top' => 'homes#top'
  end
  
  scope module: :public do
    resources :items, only: [:index]
    get '/homes/top' => 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/my_page' => 'customers#show'
  end

end
