Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, controllers: { sessions: "users/sessions", registrations: 'users/registrations' }, path: "/", path_names: { sign_in: 'ingresar', password: 'contraseña', sign_out: 'salir', registration: 'registro', sign_up: 'registrarme' } 
  devise_scope :posts do
    #get    "/iniciar_sesion"    => "users/sessions#new",         as: :new_user_session
    #post   "/iniciar_sesion"    => "users/sessions#create",      as: :user_session
    #delete "/cerrar_sesion"     => "users/sessions#destroy",     as: :destroy_user_session

    get "/publicacion/nueva"            =>  "posts#new",      as:  :new_post
    get "/publicacion/:id"              =>  "posts#show",     as:  :show_post
    get "/publicacion/:id/editar"       =>  "posts#edit",     as:  :edit_post
    post "/publicacion/nueva"           =>  "posts#create",   as:  :posts

    get "publicacion/:id/respuesta/nueva" => "answers#new",   as:  :new_answer
    post "publicacion/:id/respuesta/nueva"           =>  "answers#create",   as:  :answers
    post "publicacion/:id/respuesta/"           =>  "answers#show",   as:  :answer_showd

    get "grafica"                 => "grafica#index", as: :grafica

    get "usuario"             => "user#index", as:  :user
    get "usuario/mis_publicaciones"             => "user#my_posts", as:  :my_posts
    get '/salir'        => "users/sessions#destroy", as:  :cerrar

  end

  resources :answers
  resources :posts
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
