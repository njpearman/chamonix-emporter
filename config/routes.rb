Rails.application.routes.draw do
  root to: "vendors#index"

  resources :vendors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
