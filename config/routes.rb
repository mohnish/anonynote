Copypaste::Application.routes.draw do

  resources :entries, only: [:new, :create, :show]

  root 'entries#new'

end
