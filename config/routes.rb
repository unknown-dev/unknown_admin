Rails.application.routes.draw do
  namespace :admin do 
    resources :home,only:[:index] do
    
    end
    root :to =>"home#index"
  end
end