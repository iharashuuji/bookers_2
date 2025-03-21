Rails.application.routes.draw do
  root "books#top"
  get "up" => "rails/health#show", as: :rails_health_check


  resources :books
end
