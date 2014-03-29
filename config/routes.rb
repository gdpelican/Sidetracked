Sidetracked::Application.routes.draw do
  root 'application#index'
  
  get '/alt' => 'application#index', alt: true
  
  post '/calendar/(:year/:month)' => 'calendar#create', as: :calendar
end
