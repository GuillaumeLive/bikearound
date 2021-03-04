class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def edit
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to @bike, notice: 'The bike was successfully created.'
    else
      render :new
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: 'The bike was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_url, notice: 'The bike was successfully deleted.'
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name, :description, :price, :photo, :localization, :user_id)
  end
end
