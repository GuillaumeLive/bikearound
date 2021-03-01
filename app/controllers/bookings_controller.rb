class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit]

    # GET /bookings
    # GET /bookings.json
    def index
      @bookings = Booking.all
    end
  
    # GET /bookings/1
    # GET /bookings/1.json
    def show
      @booking = Booking.new
    end
  
    # GET /bookings/new
    def new
      @booking = Booking.new
    end
  
    # GET /bookings/1/edit
    def edit
    end
  
    # POST /bookings
    # POST /bookings.json
    def create
      @booking = Booking.new(booking_params)
  
      respond_to do |format|
        if @booking.save
          format.html { redirect_to @booking, notice: 'Your booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :new }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:rating, :start_at, :end_at, :bikes(bike_id), :users(user_id), :state)
    end
end
