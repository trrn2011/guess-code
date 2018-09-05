Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'guesses#index'

  resource :guesses do
   collection { post :import }
  end





end
