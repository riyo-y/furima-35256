class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    # @item = Item.includes(:user)
  end

  def new
    # @item = Item.new
  end

  def create
  end
end
