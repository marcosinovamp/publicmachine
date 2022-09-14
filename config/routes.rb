Rails.application.routes.draw do
  root to: 'admin#home'
  get 'unidade/:id', to: 'admin#unidade'
  get 'numeros', to: 'admin#numeros'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
