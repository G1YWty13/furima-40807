class DealsController < ApplicationController

  def index
    @deal_address = DealAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @deal_address = DealAddress.new(deal_params)
    if @deal_address.valid?
      @deal_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def deal_params
    params.require(:deal_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)
  end

end
