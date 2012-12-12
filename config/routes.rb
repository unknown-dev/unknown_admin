Rails.application.routes.draw do
  namespace :admin do 
    resources :users do
    
    end
    root :to =>"users#index"
  end
end