Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :csv_uploads, only: [:new, :create]

  root to: "csv_uploads#new"
end
