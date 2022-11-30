Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions", passwords: "admins/passwords" }
  devise_for :drivers, controllers: { registrations: "drivers/registrations", sessions: "drivers/sessions", passwords: "drivers/passwords" }

  resource :admins, only: [:show]
  resources :drivers, except: [:edit, :update, :create, :new]

  root to: "pages#landing"

end
