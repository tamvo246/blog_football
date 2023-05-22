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
    get "/trang-chu", to: "home#admin_page", as: :home_page
    resource :tests
    get 'tests/:id', to: 'tests#show', as: 'test'
    get 'tests/edit/:id', to: 'tests#edit'

    resources :abouts, path: 'gioi-thieu'
    resources :courses, path: 'khoa-hoc'
    resources :students, path: 'hoc-vien'
    resources :categories, path: 'the-loai'
    resources :posts, path: 'bai-viet'
    resources :album_images, path: 'hinh-anh'
    resources :contacts, path: 'lien-he', only: [:index, :destroy]
    resources :roles, path: 'phan-quyen'

  end

  get '/gioi-thieu/:slug', to: 'abouts#show', as: :about
  get '/khoa-hoc/:slug', to: 'courses#show', as: :course

  get '/the-loai/:slug', to: 'categories#show', as: :category
  get '/the-loai/:category_slug/:slug', to: 'posts#show', as: :category_post

  match "text_images" => "text_images#create", via: :post

  get '/lien-he', to: 'contacts#new', as: :contact
  post '/lien-he', to: 'contacts#create'
  get '/forbidden', to: 'errors#forbidden', as: 'forbidden'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
