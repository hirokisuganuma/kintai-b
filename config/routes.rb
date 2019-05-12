Rails.application.routes.draw do
  get 'sessions/new'

  get 'works/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#top'

  resources :users
end
