Rails.application.routes.draw do
  devise_for :stores, controllers: {
    sessions: 'stores/sessions',
    passwords: 'stores/passwords',
    registrations: 'stores/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'furugispaces#index'
  resources :furugispaces
  # 店舗ユーザーページ遷移
  resources :stores, only: :show do
    get '/mypage' => 'stores#mypage'
  end
  # 一般ユーザーページ遷移
  resources :users, only: :show do
    get '/mypage' => 'users#mypage'
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: %i[create destroy]
  # ニュースページ遷移
  resources :notices
  # イベントページ推移
  resources :events
  # コミュニティページ遷移
  resources :communities do
    # resources :community_users, only: [:create, :destroy]
    post 'add' => 'community_users#create'
    delete '/add' => 'community_users#destroy'
  end
  # コーディネートページ遷移
  resources :coordinations do
    resources :comments, only: :create
  end
end
