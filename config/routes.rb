Rails.application.routes.draw do
  devise_for :drivers, controllers: { registrations: "drivers/registrations", sessions: "drivers/sessions",
                                       passwords: "drivers/passwords" }
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions",
                                     passwords: "admins/passwords" }

  devise_scope :admins do
    get :payments, to: "admins#payments"
    get :user, to: "admins#user"
  end

  resource :admins, only: [:show]
  resources :drivers, except: [:edit, :update, :create, :new]
  resource :users
  resources :rides

  root to: "pages#landing"

  resource :admins, only: :show

  resources :drivers, except: %i[edit update create new]

  resources :notifies, only: :create

  get "/home", to: "users#home", as: "home"

end
