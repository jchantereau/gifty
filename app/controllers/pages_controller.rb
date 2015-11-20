class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @cities = City.first(3)
    @bars = Bar.first(4)
  end

  def comin_soon
  end
end
