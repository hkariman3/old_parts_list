Rails.application.routes.draw do

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    get "/search", to: "searches#search"
    get "/contract" => "customers#contract"

    resources :customers, only:[:edit, :show,:index, :update,]

    resources :posts, only:[:new, :create, :index, :edit, :update, :show, :destroy] do
      resources :comments, only:[:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :addresses, only:[:new, :create, :index, :edit, :update, :destroy]

    resources :contracts, only:[:show, :index, :crarte]


  end

  namespace :admin do
    get "/" => "homes#top"
    resources :genres, only:[:new, :create, :destroy]
  end
end
