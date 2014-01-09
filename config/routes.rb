PersonalSite::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  match "/about", to: "pages#about", as: :about, via: :get
  match "/education", to: "pages#education", as: :education, via: :get
  match "/courses", to: "projects#courses", as: :courses, via: :get
  match "/hackathons", to: "projects#hackathons", as: :hackathons, via: :get
  match "/portfolio", to: "projects#portfolio", as: :portfolio, via: :get
  match "/ta", to: "pages#ta", as: :ta, via: :get
  match "/miscellaneous", to: "pages#miscellaneous", as: :miscellaneous, via: :get

  match "/github", to: redirect("https://github.com/RochesterinNYC"), as: :github, via: :get
  match "/linkedin", to: redirect("http://www.linkedin.com/in/jamesrwen"), as: :linkedin, via: :get
  match "/twitter", to: redirect("https://twitter.com/RochesterinNYC"), as: :twitter, via: :get
  match "/soundcloud", to: redirect("https://soundcloud.com/james-rochester-wen"), as: :soundcloud, via: :get

  resources :projects

  get '/login', to: 'sessions#new', :as => "login"
  post '/verify', to: 'sessions#create', :as => 'verify'
  post '/logout', to: 'sessions#destroy', :as => 'logout'

  post '/markdown', to: 'projects#markdown', :as => 'markdown'
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
