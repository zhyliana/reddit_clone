RedditClone::Application.routes.draw do

  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :links do
      resources :comments, only: [:create]
    end
  end

  resources :comments, only: [:show]

end
