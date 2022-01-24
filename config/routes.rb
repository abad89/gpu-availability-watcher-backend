Rails.application.routes.draw do
  resources :updates
  resources :usergpus
  resources :users do
    resources :gpus, :usergpus
  end
  resources :gpus
  get "/auto_login", to: "auth#auto_login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
