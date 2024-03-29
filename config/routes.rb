Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, path: '', path_names: {
    sign_in: 'dang-nhap',
    sign_out: 'dang-xuat',
    # password: 'forgot_password',
    # confirmation: 'verification',
    # unlock: 'unlock_account',
    registration: '/admin/tai-khoan'
  },controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }
  namespace :admin do
    get "/", to: "home#admin_page", as: :home_page
    resources :abouts, path: 'gioi-thieu'
    resources :courses, path: 'khoa-hoc'
    resources :students, path: 'hoc-vien'
    resources :categories, path: 'the-loai'
    resources :posts, path: 'bai-viet'
    resources :album_images, path: 'hinh-anh'
    resources :contacts, path: 'lien-he', only: [:index, :destroy, :show]
    resources :roles, path: 'phan-quyen'
    resources :users, path: 'nguoi-dung', only: [:index, :destroy, :edit, :update]
    resources :coaches, path: 'huan-luyen-vien'
    resources :banners
    # devise_for :admin, controllers: {
    #   registration: 'tai-khoan',
    # }
    # resources :users, path: 'tai-khoan'
    # get 'tai-khoan/new', to: "devise/registrations#new"
  end

  get '/gioi-thieu/:slug', to: 'abouts#show', as: :about
  get '/khoa-hoc/:slug', to: 'courses#show', as: :course
  get '/media/hinh-anh', to: 'album_images#show', as: :album_image
  get '/the-loai/:slug', to: 'categories#show', as: :category
  get '/the-loai/:category_slug/:slug', to: 'posts#show', as: :category_post
  get 'hoc-vien/:id', to: 'students#show', as: :student
  get 'huan-luyen-vien/:id', to: 'coaches#show', as: :coach
  get '/tim-kiem', to: 'home#search', as: :search
  match "text_images" => "text_images#create", via: :post

  get '/lien-he', to: 'contacts#new', as: :contact
  post '/lien-he', to: 'contacts#create'
  get '/forbidden', to: 'errors#forbidden', as: 'forbidden'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
