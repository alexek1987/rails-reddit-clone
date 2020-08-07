Rails.application.routes.draw do
  devise_for :users
  get "u/:username" => "pages#profile", as: :profile

  resources :communities do
    resources :posts
  end
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
