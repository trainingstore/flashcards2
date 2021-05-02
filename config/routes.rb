Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :users, except: %i[new index destroy]
  get "/signup", to: "users#new" #register
  get 'login', to: 'sessions#new' #user_sessions
  get 'logout', to: 'sessions#destroy' #user_sessions
  root "home#home" #static_pages#home
  post "/" => "home#check_answer"
  # get "home/check_answer", to: "home#home"
  resources :cards
end
