class BookingsController < ApplicationController
  def new
    if BundlesOffer.exists?(params[:bundles_offer_id])
      @bundle = BundlesOffer.find(params[:bundles_offer_id])
    else
      redirect_to bundles_offers_url
    end
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @user = current_user
    @bundle = BundlesOffer.find(params[:bundles_offer_id].to_i)
    @booking.user = @user
    @booking.bundles_offer = @bundle
    @booking.save
    redirect_to bundles_offer_url (@bundle)
  end

  private

  def bookings_params
    params.require(:booking).permit(:shipping_method, :start_date, :end_date)
  end
end

