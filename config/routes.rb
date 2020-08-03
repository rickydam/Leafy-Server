# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users

  post '/login' => 'auth#login'
  get '/auth' => 'auth#persist'
end
