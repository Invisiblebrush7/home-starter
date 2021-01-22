class BookingsController < ApplicationController
  def new
    @bundle = BundlesOffer.find(params[:bundles_offer_id])
    @booking = Booking.new
  end
end
