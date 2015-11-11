class PagesController < ApplicationController
  def home
    @cities = City.first(3)
    @bars = Bar.first(4)
  end

end
