class ItemsController < ApplicationController

  def index
   # @item = Item.includes(:user)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    
  end

end
