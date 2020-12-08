class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.includes(:user).order('created_at  DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def move_to_index
    item = Item.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_to_deliver_id, :price, :image).merge(user_id: current_user.id)
  end
end
