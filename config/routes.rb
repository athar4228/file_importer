Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :csv_uploads, only: [:new, :create]
  resources :people, only: [:index]

  root to: "csv_uploads#new"

  get '*path' => redirect("/") #TODO: Handle routing error. Handle this using exception to avoid redirection
end
