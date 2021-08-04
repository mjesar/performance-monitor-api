Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
    	resource :performance_monitor, controller:  :performance_monitor
    end
  end
end
