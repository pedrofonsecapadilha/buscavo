class NotifiesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @ride = Ride.find(params[:ride_id])
    @user = User.find_by(phone_number: params[:phone_number])
    @notify = Notify.new
    @notify.content = "Is requesting a ride!"
    @notify.ride_id = @ride.id
    @notify.user = @user
    raise
    if @notify.save
      RidesChannel.broadcast_to(@ride,
        render_to_string(partial: "notify", locals: { notify: @notify })
      ) #<--- render
      head :ok
      respond_to do |format|
        format.html {  } #<--- redirect
        format.json {  }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
  end

end
