Rails.application.routes.draw do
  resources :csv_parsers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'csv_parsers#new'
end
