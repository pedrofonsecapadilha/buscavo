Rails.application.routes.draw do
  devise_for :drivers, controllers: { registrations: "drivers/registrations", sessions: "drivers/sessions",
                                       passwords: "drivers/passwords" }
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions",
                                     passwords: "admins/passwords" }

  devise_scope :admins do
    get :payments, to: "admins#payments"
    get :user, to: "admins#user"
  end

  root to: "pages#landing"

  resource :admins, only: :show

  resources :drivers, except: %i[edit update create new]

end
