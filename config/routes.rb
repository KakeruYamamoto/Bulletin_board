Rails.application.routes.draw do
  get 'users/show'
  get 'labels/index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    collection do
      post :new_guest,as:'guest_sign_in'
      get :search
    end
    resources :comments
  end
  root to:'posts#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
