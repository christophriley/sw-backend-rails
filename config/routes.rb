Rails.application.routes.draw do

  get "/wallets", to: "wallets#index"

  get "/transactions", to: "transactions#list"

  put "/gifts", to: "gifts#add"

  get "/reset", to: "test#reset"

  get "up" => "rails/health#show", as: :rails_health_check
end
