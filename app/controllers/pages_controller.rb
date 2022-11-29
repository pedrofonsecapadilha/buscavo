class PagesController < ApplicationController
  skip_before_action :authenticate_driver!, only: :home
  def home
  end

  def landing
  end
end
