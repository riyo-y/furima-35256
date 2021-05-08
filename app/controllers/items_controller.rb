class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')

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
    redirect_to root_path if @items.order.present?
  end

  def update
    if @items.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @items.destroy
  end

  private

  def item_params
    params.require(:item).permit(:products_name, :price, :category_id, :products_states_id, :shipping_id, :admins_information_id,
                                 :arrival_date_id, :comments, :image).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end

  def user_item
    redirect_to root_path if current_user != @items.user
  end
end
