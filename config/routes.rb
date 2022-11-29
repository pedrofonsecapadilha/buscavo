Rails.application.routes.draw do
  devise_for :drivers , controllers: { registrations: "drivers/registrations", sessions: "drivers/sessions",
    passwords: "drivers/passwords" }
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions",
                                     passwords: "admins/passwords" }
  root to: "pages#home"
  resources :drivers, except: [:edit, :update, :create, :new]
end
