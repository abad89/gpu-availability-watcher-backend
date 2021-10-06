Rails.application.routes.draw do
  resources :usergpus
  resources :users do
    resources :gpus
  end
  resources :gpus
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
