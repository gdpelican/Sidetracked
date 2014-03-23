Sidetracked::Application.routes.draw do
  root 'application#index'
  
  post '/calendar/(:year/:month)' => 'calendar#create', as: :calendar
end
