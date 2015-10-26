Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts do
    member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
    end
    resources :comments, only: [:new, :create, :destroy]
  end
end
