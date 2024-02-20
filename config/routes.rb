Rails.application.routes.draw do
  root 'static_pages/start'
  get  "/signup",  to: "users#new"
  
end
