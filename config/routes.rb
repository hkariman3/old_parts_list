Rails.application.routes.draw do

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    root to: "posts#index"
    get "/search", to: "searches#search"
    get "/mylike" => "posts#mylike"
    get "/confirm" => "contracts#confirm"
    get "/thanks" => "contracts#thanks"
    get "/list/:id" => "posts#list", as: 'list'

    resources :customers, only:[:edit, :show,:index, :update,]

    resources :posts, only:[:new, :create, :index, :edit, :update, :show, :destroy] do
      resources :comments, only:[:show, :create, :destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :addresses, only:[:new, :create, :edit, :update, :destroy]

    resources :contracts, only:[:show, :index, :create, :update]


  end

  namespace :admin do
    root to: "homes#top"
    get "top" => "homes#top"
    resources :genres, only:[:new, :create, :destroy]
    
    resources :customers, only:[:index,:destroy]
  end
end
