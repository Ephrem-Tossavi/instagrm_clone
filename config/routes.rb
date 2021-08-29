Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm 
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]

  #Définir le routage de letter_opener
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
