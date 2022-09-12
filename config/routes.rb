Rails.application.routes.draw do


  namespace :admin do
    root "homes#top"
    resources :users,only: [:show, :index, :edit, :update]

  end
  get 'comments/new'
  get 'comments/index'
  root :to =>"user/homes#top"

  post '/guests/guest_sign_in', to: 'guests#new_guest'

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  namespace :user do
    resources :users, only: [:show,:edit,:update]

    get "user/:id/unsubscribe" => "users#unsubscribe",as:"unsubscribe"
    patch "user/:id/withdraw" => "users#withdraw",as:"withdraw"

  end

  resources :posts,only: [:new,:index,:show,:create,:edit,:update,:destroy] do
  resources :comments,only: [:new,:index,:create,:destroy]
  end

  devise_for :admins,skip: [:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end