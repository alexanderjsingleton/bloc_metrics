Rails.application.routes.draw do
 

  resources :applications do
     resources :events, except: [:index]
   end


  # get 'applications/index'

  # get 'applications/show'

  # get 'applications/new'

  # get 'applications/edit'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

    root to: 'welcome#index'

  # #1
   namespace :api, defaults: { format: :json } do
  # #2
     resources :events, only: [:create]
   end

 
end
