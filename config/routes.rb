Rails.application.routes.draw do
  devise_for :users
  root to: "furugispaces#index"
  resources :furugispaces do
    member do
      get :noticeDetail
    end
  end
  # ニュースページ遷移
  resources :notices, only: :index
end
