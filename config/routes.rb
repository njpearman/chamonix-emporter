Rails.application.routes.draw do
  scope :locale do
    resources :vendors
  end

  get ":locale", to: "vendors#index", as: :localized

  root to: "vendors#index"
end
