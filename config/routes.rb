Rails.application.routes.draw do
  get 'tweets/index'

  get 'tweets/show'

  get 'tweets/new'

  get 'tweets/fail'

  get 'tweets/success'

  get 'tweets/admin'

  get 'tweets/403'

  get 'tweets/admin_add'

  post 'tweets/admin_add' => 'tweets#admin_create'

  post 'tweets' => 'tweets#create'

  #devise_for :users #  , path_names: { sign_in: "login", sign_out: "logout"}
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  get 'home/index'

  get 'home/show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ログイン画面をホームにする
  root :to => "home#index"



end
