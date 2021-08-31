Rails.application.routes.draw do
  root "users#new"
  resources :blogs do
    collection do
      post :confirm 
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites

  #Définir le routage de letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
