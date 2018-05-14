Rails.application.routes.draw do
  namespace :admin do
    resources :chips
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :chips
    resources :help_requests
    resources :buy_requests
    resources :users
    resources :comments
    resources :favorites
    resources :invitations
    resources :suggestions
    resources :authentications
    resources :likes

    root to: "users#index"
  end

end
