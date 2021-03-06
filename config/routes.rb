Rails.application.routes.draw do

  # get 'applications/index'

  # get 'applications/show'

  # get 'applications/new'

  # get 'applications/edit'

  resources :events
 

  resources :applications do
     resources :events, except: [:index]
  end

  

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  get 'applications' => 'welcome/applications#index'



    root to: 'welcome#index'

  # #1
   namespace :api, defaults: { format: :json } do
  # #2
     resources :events, only: [:create]
     match 'events' => "events#create", via: :options, as: :events_options
   end

  # authenticated :user do
  #   root to: "registered_applications#index", as: :authenticated_root, via: :get
  # end

  # unauthenticated do
  #   root 'welcome#index'
  # end

 
end
