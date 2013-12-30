Copypaste::Application.routes.draw do

  resources :entries, only: [:new, :create, :show]
  get ':id' => 'entries#show'

  root 'entries#new'

end
