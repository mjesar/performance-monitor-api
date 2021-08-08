Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    resources :tests do
      post 'last', on: :collection
    end
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
