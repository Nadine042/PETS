class BookingsController < ApplicationController
  before_action :set_pet, only: [:new, :create]
  before_action :set_booking, only: [:show]
  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:user, :pet, :start_date, end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
