Rails.application.routes.draw do
resources :users
resource :session
resources :goals
root 'goals#index'


end
