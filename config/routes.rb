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
  root to: "furugispaces#index"
  resources :furugispaces do
    member do
      get :noticeDetail
    end
  end
  # ニュースページ遷移
  resources :notices, only: [:index, :new, :create]
  # コミュニティページ遷移
  resources :communities
  # コーディネートページ遷移
  resources :coordinations do
    resources :comments, only: :create
  end
end
