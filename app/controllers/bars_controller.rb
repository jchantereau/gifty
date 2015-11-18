class BarsController < ApplicationController
  before_action :set_city, only: [:index]
  before_action :find_bar, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!

  def index
    @bars = @city.bars.all
  end

  def show
    @gifts = []
  end

  private

  def find_bar
    @bar = Bar.find(params[:id])
  end

  def set_city
    @city = City.find(params[:city_id])
  end

end
