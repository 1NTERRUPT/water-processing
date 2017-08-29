Rails.application.routes.draw do
  devise_for :users

  post '/operate', to: 'home#operate'

  root to: 'home#controls'
end
