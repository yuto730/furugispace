Rails.application.routes.draw do
  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    passwords:     'stores/passwords',
    registrations: 'stores/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :relationships, only: [:create, :destroy]

  root to: "furugispaces#index"
  resources :furugispaces
  #ユーザーページ遷移
  resources :users, only: :show do
    get '/mypage' => 'users#mypage'
  end
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
