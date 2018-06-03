Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :users
    resources :chips
    resources :help_requests
    resources :buy_requests
    resources :comments
    resources :favorites
    resources :invitations do
      post "generate", on: :collection
    end

    resources :suggestions
    resources :authentications
    resources :likes

    root to: "users#index"
  end

end
