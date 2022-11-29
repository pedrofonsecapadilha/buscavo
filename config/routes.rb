Rails.application.routes.draw do
  devise_for :drivers
  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions",
                                     passwords: "admins/passwords" }

  resource :admins, only: [:show]

  root to: "pages#home"
end
