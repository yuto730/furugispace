Rails.application.routes.draw do
  get 'furugispaces/index'
  root to: "furugispaces#index"
end
