Rails.application.routes.draw do


  root :to =>"user/homes#top"

  post '/guests/guest_sign_in', to: 'guests#new_guest'

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  namespace :user do
    resources :users, only: [:show,:edit,:update]

    get "user/:id/unsubscribe" => "user/users#unsubscribe",as:"unsubscribe"
    patch "user/:id/withdraw" => "user/users#withdraw",as:"withdraw"

  end

  devise_for :admins,skip: [:registrations,:passwords],controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
