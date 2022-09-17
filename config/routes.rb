Rails.application.routes.draw do



  namespace :admin do
    root "homes#top"
    resources :users,only: [:show, :index, :edit, :update]
    resources :posts,only: [:index,:show,:destroy]
    resources :comments,only: [:destroy]
  end
  get 'comments/new'
  get 'comments/index'
  root :to =>"user/homes#top"


  devise_for :users,skip: [:passwords],controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  namespace :user do
    resources :users, only: [:show,:edit,:update] do
    get ":id/favorites" => "users#favorites",on: :collection, as: "myfavorites"
   end
    get "user/:id/unsubscribe" => "users#unsubscribe",as: "unsubscribe"
    patch "user/:id/withdraw" => "users#withdraw",as: "withdraw"

  end

  resources :posts, only: [:new,:index,:show,:create,:edit,:update,:destroy] do
      resources :comments, only: [:new,:index,:create,:destroy]
      resources :favorites, only: [:create,:destroy]
      collection do
      get 'search'
      get 'tag_search'
    end
    
    
  end

  devise_for :admins,skip: [:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chatgroups
end
