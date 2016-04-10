Rails.application.routes.draw do
  resources :tags
  resources :question_selections
  resources :quizzes
  resources :questions
  resources :users
  root to: 'visitors#about'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
