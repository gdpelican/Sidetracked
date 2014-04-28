Sidetracked::Application.routes.draw do
  root 'application#index'
  
  get '/alt' => 'application#index', alt: true
  
  post '/calendar/(:year/:month)' => 'calendar#create', as: :calendar
  
  resources :gigs, only: [:create, :update, :destroy]
  resources :gigs, controller: :entries, type: :gigs, as: :gig_entries, only: [:new, :edit, :index, :show]
  resources :acts, controller: :entries, type: :acts
  resources :testimonials, controller: :entries, type: :testimonials
  resources :performers, controller: :entries, type: :performers
  
end
