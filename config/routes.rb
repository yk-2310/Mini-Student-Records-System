Rails.application.routes.draw do
  
  get 'records/home'
  get 'records/destroyAll'
  get 'records/duplicate'
  post 'records/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :records
  root 'records#home'

end
