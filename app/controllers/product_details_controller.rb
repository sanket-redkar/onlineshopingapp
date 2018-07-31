class ProductDetailsController < ApplicationController
  before_action :set_shoping_card
  before_action :set_product_detail

  # POST /product_details/1
  # POST /product_details/1.json
  def add
    new_product = @product_detail.source.find_same_available_products.where.not(id: @shoping_card.product_details.where(source_type: @product_detail.source_type).pluck(:source_id)).sample
    if new_product.blank?
      flash[:error] = "No #{@product_detail.source_type} available with same price."
    else
      product_detail = @shoping_card.product_details.build(source_type: new_product.class, source_id: new_product.id)
      if product_detail.save
        flash[:alert] = "Added successfuly!"
      else
        flash[:error] = "No #{@product_detail.source_type} available with same price."
      end
    end
    respond_to do |format|
      format.js { render 'shoping_cards/show' }
    end
  end

  # DELETE /product_details/1
  # DELETE /product_details/1.json
  def minus
    if @product_detail.destroy
      flash[:alert] = "Removed successfuly!"
    else
      flash[:error] = "Unable to remove"
    end
    respond_to do |format|
      format.js { render 'shoping_cards/show' }
    end
  end

  private

    def set_shoping_card
      if session[:shoping_card_id].present?
        @shoping_card = ShopingCard.where(id: session[:shoping_card_id]).first
      end
      unless @shoping_card
        @shoping_card = ShopingCard.create
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product_detail
      @product_detail = @shoping_card.product_details.where(source_id: params[:source_id], source_type: params[:source_type]).sample
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_detail_params
      params.require(:product_detail).permit(:model_id, :product_id, :price, :shoping_card_id)
    end
end
