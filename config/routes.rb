Rails.application.routes.draw do
  namespace :api, { format: :json } do
    namespace :v1 do
      resources :moneies, only: [:index, :show, :create]
    end
  end
end
