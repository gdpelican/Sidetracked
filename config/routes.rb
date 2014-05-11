Sidetracked::Application.routes.draw do
  root 'application#index'
    
  post '/calendar/(:year/:month)' => 'calendar#create', as: :calendar
  
  resources :gigs, only: [:create, :update, :destroy]
  resources :gigs, controller: :entries, type: :gigs, as: :gig_entries, only: [:new, :edit, :index, :show]
  resources :acts, controller: :entries, type: :acts
  resources :testimonials, controller: :entries, type: :testimonials
  resources :performers, controller: :entries, type: :performers
  
  post '/login' => 'sessions#create', as: :login
  match '/logout' => 'sessions#destroy', as: :logout, via: [:get, :post]
  
  get '/*all.html', to: redirect('/')
  
end
