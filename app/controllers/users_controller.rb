class UsersController < ApplicationController

  def home
    @admin = Admin.find(params[:refeer])
  end

  def show
    @user = User.find_by(params[:admin_id])
  end

end
