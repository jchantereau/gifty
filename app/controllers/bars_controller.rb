class BarsController < ApplicationController
  before_action :set_city

  def index
    @bars = Bar.all
    unless @city.nil?
      @bars = @city.bars.all
    end
  end

  def show
    @gifts = []
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

end
