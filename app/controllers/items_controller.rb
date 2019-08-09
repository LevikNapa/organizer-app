class ItemsController < ApplicationController
  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end
end
