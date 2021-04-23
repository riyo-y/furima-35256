class ItemsController < ApplicationController

  def index
    @user = User.includes(:user)
  end
  
  def new
  end
  
  def create
  end
  
end
