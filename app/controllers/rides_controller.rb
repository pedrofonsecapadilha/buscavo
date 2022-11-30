class RidesController < ApplicationController
  def new
    @ride = Ride.new(ride_params)
  end

  private
  def ride_params
    params.require(:ride).permit(:start_address, :end_address, :price, :user_id, :driver_id)
  end
end
