Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, path: '', path_names: {
    sign_in: 'dang-nhap',
    sign_out: 'dang-xuat',
    # password: 'forgot_password',
    # confirmation: 'verification',
    # unlock: 'unlock_account',
    # registration: 'account'
  },controllers: {
    sessions: 'users/sessions',
  }
  namespace :admin do
    get "/trang-chu", to: "home#admin_page"
    resource :tests
    get 'tests/:id', to: 'tests#show', as: 'test'
    get 'tests/edit/:id', to: 'tests#edit'
  end

  match "text_images" => "text_images#create", via: :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
