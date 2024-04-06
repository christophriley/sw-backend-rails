Rails.application.routes.draw do

  get "/wallets", to: "wallets#index"

  put "/gifts", to: "gifts#add"

  get "up" => "rails/health#show", as: :rails_health_check
end
