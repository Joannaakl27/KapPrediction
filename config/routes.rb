Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "vessel_visits#index"
  resources :vessel_visits
end
