class Drivers::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    drivers_path(resource)
  end
end
