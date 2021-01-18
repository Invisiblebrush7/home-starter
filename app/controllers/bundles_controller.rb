class BundlesController < ApplicationController
  def index
    @bundles = BundlesOffer.all
  end

  def show
    if BundlesOffer.exists?(params[:id])
      @bundle = BundlesOffer.find(params[:id])
    else
      redirect_to bundles_url
    end
  end

  def new
    @bundle = BundlesOffer.new
  end

  def create
    @bundle = BundlesOffer.new(bundles_offer_params)
    if @bundle.save
      redirect_to bundles_url
    else
      render :new
    end
  end

  def edit
    if BundlesOffer.exists?(params[:id])
      @bundle = BundlesOffer.find(params[:id])
    else
      redirect_to bundles_url
    end
  end

  def update
    @bundle = BundlesOffer.find(params[:id])
    @bundle.update(bundles_offer_params)
    redirect_to bundles_url
  end

  def destroy
    @bundle = BundlesOffer.find(params[:id])
    @bundle.destroy
    redirect_to bundles_url
  end

  private

  def bundles_offer_params
    params.require(:BundlesOffer).permit(:name, :description, :price, :user_id)
    # I don't know if user id will work
  end
end
