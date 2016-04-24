Rails.application.routes.draw do
  resources :class_names
  # get 'admin/index'
  # get '/admin' => 'admin#index'
  

  resources :tags
  resources :question_selections
  resources :quizzes
  resources :questions#, only: [:index, :show]
  resources :users
  root to: 'visitors#about'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  namespace :admin do
    resources :questions
  end
end
