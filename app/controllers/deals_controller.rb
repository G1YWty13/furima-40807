class DealsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @deal_address = DealAddress.new
  end

  def create
    @deal_address = DealAddress.new(deal_params)
    if @deal_address.valid?
      @deal_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def deal_params
    params.require(:deal_address).permit(:housenumber, :prefecture_id, :town, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
