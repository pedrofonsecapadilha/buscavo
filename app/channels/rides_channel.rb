class RidesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    ride = Ride.find(params[:id])
    stream_for ride
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
