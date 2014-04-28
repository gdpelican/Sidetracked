Sidetracked::Application.routes.draw do
  root 'application#index'
  
  get '/alt' => 'application#index', alt: true
  
  post '/calendar/(:year/:month)' => 'calendar#create', as: :calendar
  
  resources :gigs, only: [:new, :edit, :create, :update, :destroy], as: :gig_entries
  resources :gigs, controller: :entries, type: :gigs, only: [:index, :show]
  resources :acts, controller: :entries, type: :acts
  resources :testimonials, controller: :entries, type: :testimonials
  resources :performers, controller: :entries, type: :performers
  
end
