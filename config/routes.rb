Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    resources :tests
  end
end
