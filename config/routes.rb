Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home'
  get 'static_pages/flash'
  get 'static_pages/translate'
  get 'translation/paste'
  get 'translation/flash'
  get 'translation/flashcards'

end
