class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :mark_accepted, :mark_refused]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where({ user: current_user})
    @bookings_on_my_bikes = current_user.bikes.map {|bike| bike.bookings}.flatten.sort_by{|booking| booking.id}.reverse

  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.new
  end

  # GET /bookings/new
  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    @booking.bike = @bike
    if @booking.save
      redirect_to bike_path(params[:bike_id]), notice: 'Your booking was successfully created.'
    else
      render :new
    end
  end
  # route type patch url /bookings/:id/mark_accepted
  def mark_accepted
    @booking.update(state: 'accepted')
    redirect_to bookings_path
  end

  def mark_refused
    @booking.update(state: 'refused')
    redirect_to bookings_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:rating, :start_at, :end_at, :state)
  end
end
