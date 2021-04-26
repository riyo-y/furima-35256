class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    Items.create(item_params)
  end

  def show
  @item = item.find(params[:id])
  end

  private
   def item_params
    params.require(:item).permit(:products_name, :price, :user, :category_id, :products_states_id, :shipping_id, :admins_information_id, :arrival_date_id, :comments).marge(user_id: current_user.id)
  end
end
