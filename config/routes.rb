Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
    # :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"

  resources :games do 
    get 'search',          :on => :collection
    post 'join_leave',     :on => :collection
    
    post 'join_game',      :on => :member
    post 'leave_game',     :on => :member
    post 'remove_player',  :on => :member
    post 'start_game',     :on => :member
    post 'end_game',       :on => :member
  end

  get '/search', :to => "pages#search"
end
