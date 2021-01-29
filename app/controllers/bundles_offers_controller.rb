class BundlesOffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bundles = BundlesOffer.all
    if (user_signed_in? && current_user.user_type == "Renter") || !user_signed_in?
      @user = current_user
    elsif user_signed_in? && current_user.user_type == "Seller"
      @user = current_user
      @bundles_user = BundlesOffer.where("user_id = #{@user.id}")
    end
  end

  def show
    if BundlesOffer.exists?(params[:id])
      @bundle = BundlesOffer.find(params[:id])
    else
      redirect_to bundles_offers_url
    end
  end

  def new
    @bundle = BundlesOffer.new
    @user = current_user
  end

  def create
    @bundle = BundlesOffer.new(bundles_offer_params)
    @bundle.user = current_user
    params[:bundles_offer][:furnitures].each do |furniture_id|
      if Furniture.exists?(furniture_id)
        @bundle.furnitures.push(Furniture.find(furniture_id))
      end
    end
    @bundle.user.update_attribute(:user_type, "Seller") if @bundle.save
    redirect_to bundles_offers_url
  end

  def edit
    if BundlesOffer.exists?(params[:id])
      @bundle = BundlesOffer.find(params[:id])
    else
      redirect_to bundles_offers_url
    end
  end

  def update
    @bundle = BundlesOffer.find(params[:id])
    @bundle.update(bundles_offer_params)
    redirect_to bundles_offers_url
  end

  def destroy
    @bundle = BundlesOffer.find(params[:id])
    @bundle.destroy
    redirect_to bundles_offers_url
  end

  private

  def bundles_offer_params
    params.require(:bundles_offer).permit(:name, :description, :price, :furnitures, photos: [])
  end
end
