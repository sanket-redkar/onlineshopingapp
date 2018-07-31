class ShopingCardsController < ApplicationController
  before_action :set_shoping_card, only: [:edit, :update, :destroy, :purchase]

  # GET /shoping_cards
  # GET /shoping_cards.json
  def index
    @shoping_cards = current_user ? current_user.shoping_cards : ShopingCard.where(id: session[:shoping_card_id])
  end

  # GET /shoping_cards/1
  # GET /shoping_cards/1.json
  def show
    if session[:shoping_card_id].present?
      @shoping_card = ShopingCard.where(id: session[:shoping_card_id]).first
    end
    unless @shoping_card
      @shoping_card = ShopingCard.new()
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /shoping_cards
  # POST /shoping_cards.json
  def create
    if session[:shoping_card_id].present?
      @shoping_card = ShopingCard.where(id: session[:shoping_card_id]).first
    end

    if @shoping_card
      @shoping_card.assign_attributes(shoping_card_params)
    else
      @shoping_card = ShopingCard.new(shoping_card_params)
    end

    respond_to do |format|
      if @shoping_card.save
        @shoping_card.user = current_user
        session[:shoping_card_id] = @shoping_card.id
        format.html { redirect_to @shoping_card, notice: 'Shoping card was successfully created.' }
        format.js { render 'shoping_cards/show' }
      else
        format.html { render :new }
        format.js { render 'shoping_cards/show' }
      end
    end
  end

  # PUT /shoping_cards/1
  # PUT /shoping_cards/1.json
  def purchase
    @shoping_card.user = current_user
    @shoping_card.process!
    session[:shoping_card_id] = nil
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Continue Shopping.' }
    end
  end

  # DELETE /shoping_cards/1
  # DELETE /shoping_cards/1.json
  def destroy
    @shoping_card.destroy
    respond_to do |format|
      format.html { redirect_to shoping_cards_url, notice: 'Shoping card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoping_card
      @shoping_card = ShopingCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoping_card_params
      params.require(:shoping_card).permit(product_details_attributes: [:source_id, :source_type])
    end
end
