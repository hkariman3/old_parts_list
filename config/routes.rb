Rails.application.routes.draw do

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    resources :customers, only:[:index, :edit, :show, :create, :update,]

    resources :posts, only:[:new, :create, :index, :edit, :update, :show, :destroy] do
      resources :comments, only:[:create]
    end

    resources :addresses, only:[:new, :create, :index, :edit, :update, :destroy]

    resources :contracts, only:[:show, :index, :crarte]

    resource :likes, only: [:create, :destroy]

  end

  namespace :admin do

    resources :genres, only:[:new, :create, :destroy]
  end
end
