class BundlesOffersController < ApplicationController
  def index
    @bundles = BundlesOffer.all
    @user = current_user
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

    if @bundle.save
      redirect_to bundles_offers_url
    else
      redirect_to bundles_offers_url
    end
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