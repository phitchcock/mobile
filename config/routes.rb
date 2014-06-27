Rails.application.routes.draw do
  root "static_pages#index"
  
  resources :sites do 
    resources :pages
  end
end
