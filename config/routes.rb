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
  match "/blog", to: "posts#index", as: :blog, via: :get
  match "/miscellaneous", to: "pages#miscellaneous", as: :miscellaneous, via: :get

  match "/github", to: redirect("https://github.com/RochesterinNYC"), as: :github, via: :get
  match "/linkedin", to: redirect("http://www.linkedin.com/in/jamesrwen"), as: :linkedin, via: :get
  match "/twitter", to: redirect("https://twitter.com/RochesterinNYC"), as: :twitter, via: :get
  match "/soundcloud", to: redirect("https://soundcloud.com/james-rochester-wen"), as: :soundcloud, via: :get

  resources :projects
  resources :posts
  resources :uploads

  get '/login', to: 'sessions#new', :as => "login"
  post '/verify', to: 'sessions#create', :as => 'verify'
  post '/logout', to: 'sessions#destroy', :as => 'logout'

  post '/markdown', to: 'projects#markdown', :as => 'markdown'
  post '/delete_attachment', to: 'projects#delete_attachment', :as => 'delete_attachment'
  post '/delete_file', to: 'uploads#delete_file', :as => 'delete_file'


end
