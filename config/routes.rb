Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
    # :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"

  resources :games do 
    get  'search',         :on => :collection
    post 'join_leave',     :on => :collection

    post 'remove_player',  :on => :member
    post 'join',           :on => :member
    post 'leave',          :on => :member
    post 'start',          :on => :member
    post 'end',            :on => :member
  end

  get '/search',  :to => "pages#search"
  get '/history', :to => "pages#history"
end
