Rails.application.routes.draw do
  
  root 'pages#home' # Redirección de la raiz de la aplicación al controlador pages y método home
  get '/home', to:'pages#home' # Redirección al controlador pages y método home
  
  
  # Crea todas las rutas para las recetas
  resources :recipes
end
