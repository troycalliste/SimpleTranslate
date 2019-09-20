Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/flash'
  get 'static_pages/sign'
  get 'static_pages/translate'
  get 'static_pages/history'
  get 'static_pages/favorite'
  get 'static_pages/flashfavorite'
  get 'static_pages/delfavorite'
  get 'static_pages/reference'
  get 'translation/paste'
  get 'translation/flash'
  get 'translation/flashcards'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  get "/login", to: redirect("/auth/google_oauth2")
  get "/sessions", to: 'sessions#destroy'
  get "/auth/google_oauth2/callback", to: "sessions#create"
  resource :sessions, only: [:create, :destroy]

end
