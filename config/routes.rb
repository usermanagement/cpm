Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users do 
    resources :likes, controller: 'user/likes', only: [:create, :destroy, :new]
    get '/all_likes/:liked_item', controller: 'user/likes', action: 'show_all_likes', as: 'show_all_likes'
    get '/all_comments/:liked_item', controller: 'user/comments', action: 'show_all_comments', as: 'show_all_comments'
  end
  resources :companies do
    resources :teams, controller: 'company/teams' do
      resources :posts, controller: 'company/posts' do 
        resources :comments, controller: 'user/comments', except: [:show, :index]
      end
    end
  end
  root 'teams#index'
end  