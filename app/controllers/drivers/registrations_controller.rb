class Drivers::RegistrationsController < Devise::RegistrationsController
  protected
  def after_update_path_for (resource)
    drivers_path (resource)
  end
end
