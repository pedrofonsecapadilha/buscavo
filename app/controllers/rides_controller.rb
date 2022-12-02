class RidesController < ApplicationController
  def new
    @admin = Admin.find(params[:refeer])
    @user = @admin.user.first
    @ride = Ride.create(user_phone_number: @user.phone_number, user: @user)
  end
end
