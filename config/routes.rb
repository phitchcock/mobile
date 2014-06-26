Rails.application.routes.draw do
  root "sites#index"
  
  resources :sites do 
    resources :pages
  end
end
