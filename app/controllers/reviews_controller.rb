class ReviewsController < ApplicationController
  # sonst müsste ich in jeder Methode anstatt von
  # @booking = Booking.find(params[:booking_id]
  before_action :set_booking, only: [ :create, :new ]

  def new
    # wenn ein neues review erstellt wird, wird dies nur abhängig
    # von der Buchung erstellt
    @review = Reviews.new
  end

  def create
    # create speichert das neue review in der Datenbank
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    if @review.save
      redirect_to booking_path(@booking)
    else
      # das Formular wird neu angezeigt wenn das speichern
      # nicht erfolgreich war
      render :new
    end
  end

  private

  def set_booking
    # sonst müsste ich in jeder Methode anstatt von
    # @booking = Booking.find(params[:booking_id]
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    # strong params
    params.require(:review).permit(:content, :rating, :booking, :user)
  end
end
