Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users do
        collection do
          get "check_auth"
        end
      end
    end
  end
 
  
end
