Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homepage", to: "pages#index"
  get "/about", to: 'pages#about'
  get "/contact", to: "pages#contact"

  #verb #path_you_name, #controller_action
end
