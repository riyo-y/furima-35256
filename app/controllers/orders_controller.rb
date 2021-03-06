class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_conditions

  def index
    @order_purchase = OrderPurchase.new
  end


  def create
   @order_purchase = OrderPurchase.new(order_params)
   if @order_purchase.valid?
     pay_item
      @order_purchase.save
      redirect_to root_path
  else
    render :index
   end
  end


private

  def order_params
   params.require(:order_purchase).permit(:postcode, :admins_information_id, :city, :block, :building, :phone_number).merge(
    user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end


  def set_conditions
      if @item.order.present? || @item.user == current_user
        redirect_to root_path
  end    
 end
end

