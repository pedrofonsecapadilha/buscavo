class PagesController < ApplicationController
  skip_before_action :authenticate_driver!, only: :home
  def home
  end
  def profile_driver
    @driver = Driver.find(params[:id])
    ##@ride = Rides.where(driver_id: current_user)
    ##@reviews = Reviews.where(driver_id: current_user)
  end
end
