class UsersController < ApplicationController
  def home
    @admin = Admin.find(params[:admin_id])
  end

  def show
    @user = User.find_by(params[:admin_id])
  end

  ##def call_rider
    ##@admin = Admin.find(params[:admin_id])
    #@user = User.find_by(admin:@admin)
    #@ride = Ride.new
  #end
  def create_ride
    @admin = Admin.find(params[:admin_id])
    @ride.user = @user
    @ride.driver = Driver.all.sample
    @ride = Ride.new
    if @ride.save
      redirect_to ride_path(@ride)
    end
  end
end
