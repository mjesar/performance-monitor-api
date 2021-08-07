Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    resources :tests do
      post 'last', :on => :collection
    end
  end
end
