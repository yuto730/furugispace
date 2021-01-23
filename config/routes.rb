Rails.application.routes.draw do
  devise_for :users
  root to: "furugispaces#index"
  resources :furugispaces do
    collection do
      get :notice
    end
    member do
      get :noticeDetail
    end
  end
end
