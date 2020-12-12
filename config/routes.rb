Rails.application.routes.draw do
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}

  #自動ログイン用path
  devise_scope :user do
    get 'guest', to: 'devise/sessions#new'
  end
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users do
        collection do
          get "check_auth"
          get "get_user"
          get "search"
        end
      end
      resources :habits do
        collection do
          post "done_habit"
          delete "undo_habit"
        end
      end
      resources :follows, :only
    end
  end


  #activestorageがhome#indexにredirectする事を防ぐ
  get '/rails/active_storage/blobs/:signed_id/*filename' => 'active_storage/blobs#show'
  get '/rails/active_storage/disk/:encoded_key/*filename' => 'active_storage/disk#show'
  get '*path' => 'home#index'
 
  
end
