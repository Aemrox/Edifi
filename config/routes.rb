Rails.application.routes.draw do







  root "home#index"

  get 'home/index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/users/teacherize', to: 'users#teacherize'
  get '/users/:id/calendar', to: 'users#calendar'
  post '/users/becometeacher', to: 'users#becometeacher'
  resources :users, only: [:new, :create, :show, :update]
  get '/homepage', to: 'users#homepage'

  resources :subjects, only: [:new, :create, :index, :show]

  post '/skillsearch', to: 'skills#search'


  resources :skills, only: [:new, :create, :index, :show]
  resources :connections, only: [:new, :show, :create, :update]
  resources :conversations, only: [:new, :show, :create] do
    resources :messages, only: [:new, :create, :index, :show]
  end

  get '/lessons/json', to: 'lessons#lesson_json'
  post '/lessons/render_options', to: 'lessons#render_options'
  resources :lessons, only: [:create, :show]

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
