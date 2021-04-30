class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

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
    @items = Item.find(params[:id])
  end


def edit
  @items = Item.find(params[:id])
  if current_user != @items.user
    redirect_to root_path 
  end
  
end

def update
  @items = Item.find(params[:id])
  if @items.update(item_params)
    render :show
  else
    render :edit
  end

end



  private

  def item_params
    params.require(:item).permit(:products_name, :price, :category_id, :products_states_id, :shipping_id, :admins_information_id,
                                 :arrival_date_id, :comments, :image).merge(user_id: current_user.id)
  end
end
