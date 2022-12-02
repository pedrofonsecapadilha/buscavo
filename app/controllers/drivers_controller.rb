class DriversController < ApplicationController
  before_action :authenticate_driver!, only: %i[index show]

  def index
    @driver = current_driver
    # @ride = Rides.where(driver_id: current_user)
    # @reviews = Reviews.where(driver_id: current_user)
  end

  def show
    @driver = current_driver
    @rides = Ride.all
  end
end
