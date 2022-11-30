class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: %i[show index]
  def show
  end
end
