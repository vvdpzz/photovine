Photovine::Application.routes.draw do
  devise_for :users
  resources :vines do
    member do
      get :photos
    end
  end
  resources :photos
  root :to => 'home#index'
end
