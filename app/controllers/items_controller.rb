class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  def item_params
    params.require(:item).permit(:item_name, :content, :image, :category_id, :condition_id, :delivery_id, :area_id, :scheduled_id, :price).merge(user_id: current_user.id)
  end
end