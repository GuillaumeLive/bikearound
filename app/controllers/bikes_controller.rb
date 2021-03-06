class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      @bikes = Bike.search_by_city(params[:query])
    else
      @bikes = Bike.all
    end

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
    @bike.category = bike_params[:category].last
    @bike.size = bike_params[:size].last
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
    redirect_to account_bikes_path, notice: 'The bike was successfully deleted.'
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name, :description, :price, :photo, :localization, :user_id, size: [], category: [])
  end
end
