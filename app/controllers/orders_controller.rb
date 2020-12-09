class OrdersController < ApplicationController
  before_action :set_item
  def index
    @order_address = OrderAddress.new
  end 


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_ef9d311f7d4039c649701fb9"
      pay_item
      @order_address.save
      redirect_to root_path
    else 
      render "orders/index"
    end
  end 

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_ef9d311f7d4039c649701fb9"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end 

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
