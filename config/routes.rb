Rails.application.routes.draw do

  get "/wallets", to: "wallets#index"

  get "/transactions", to: "transactions#list"
  put "/transactions", to: "transactions#add"

  put "/gifts", to: "gifts#add"

  get "/reset", to: "test#reset"

  get "up" => "rails/health#show", as: :rails_health_check
end
