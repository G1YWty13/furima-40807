class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
    # @deals = Deal.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item)
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :information, :category_id, :condition_id, :cost_id, :prefecture_id, :sendday_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end
