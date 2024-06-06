class DealsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to controller: 'items', action: 'index' if current_user.id == @item.user.id || @item.deal.present?
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @deal_address = DealAddress.new
  end

  def create
    @deal_address = DealAddress.new(deal_params)
    if @deal_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
      @deal_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def deal_params
    params.require(:deal_address).permit(:housenumber, :prefecture_id, :town, :street, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
