class RidesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def new
    @admin = Admin.find(params[:refeer])
    @user = @admin.user.first
    @ride = Ride.create(user_phone_number: @user.phone_number, user: @user)
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @user = User.find_by(phone_number: params[:phone_number])
    @notify = Notify.new
    @notify.content = "Is requesting a ride!"
    @notify.ride_id = @ride.id
    @notify.user = @user
    if @notify.save
      RidesChannel.broadcast_to(@ride, @notify)
      head :ok
      # redirect_to ride_path(@ride)

      # respond_to do |format|
      #   format.html {  } #<--- redirect
      #   format.json {  }
      # end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
    # @ride = Ride.new(ride_params)
    # respond_to do |format|
    #   if @ride.save
    #     format.html { redirect_to ride_url(@ride), notice: "ride was successfully created." }
    #     format.json { render :show, status: :created, location: @ride }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @ride.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

  def ride_params
    params.require(:ride).permit(:start_address, :end_address, :price, :user_id, :driver_id, :user_phone_number)
  end
end
