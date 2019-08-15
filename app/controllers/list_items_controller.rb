class ListItemsController < ApplicationController
  def new
    if params[:list_id] && @list = List.find_by_id(params[:list_id])
      @list_items = @list.list_items.build
    else
      @error = "That list doesn't exist" if params[:list_id]
      @list_item = ListItem.new
    end
  end

  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.build_item
   if @list_item.save
     #figure out how to set sessions when @list_item doesn't have a user_id
     redirect_to list_item_path(@list_item)
   else
     render :new
   end
  end

  def show
    set_list_item
  end

  def index
    if params[:list_id] && @list = List.find_by_id(params[:list_id])
      @list_items = @list.list_items
    else
      @error = "That list doesn't exist" if params[:list_id]
      @list_items = ListItem.all
    end
  end

  private

  def set_list_item
    @list_item = ListItem.find_by_id(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:list_id, :item_id, :content)
  end
end
