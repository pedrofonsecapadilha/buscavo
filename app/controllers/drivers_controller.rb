class DriversController < ApplicationController
  before_action :authenticate_driver!, only: :index

  def index
    @driver = current_driver
    ##@ride = Rides.where(driver_id: current_user)
    ##@reviews = Reviews.where(driver_id: current_user)
  end
end
