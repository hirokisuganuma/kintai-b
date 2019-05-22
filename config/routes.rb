Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root
  root 'application#top'

  #session resource
  get  '/signup',   to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  
  #user resource
  resources :users do
    resources :works, only: :create
  end
  get    'users/:id/edit_basic_info',to:'users#edit_basic_info',as:'edit_basic_info'
  patch  'users/:id/update_basic_info' , to: 'users#update_basic_info',as:'update_basic_info'
end
