Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
get '/index', to: 'home#index', as: 'index'
get '/admin', to: 'home#admin', as: 'admin'
patch '/save_page', to: 'home#save_page', as: 'save_page'
get '/resync', to: 'home#resync', as: 'resync'
get '/re-render', to: 'home#rerender', as: 'rerender'
end
