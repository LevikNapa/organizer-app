class ListItemsController < ApplicationController
  def new
    if params[:list_id] && @list = List.find_by_id(params[:list_id])
      @list_item = @list.list_items.build
    else
      @list_item = ListItem.new
    end
  end

  def create
    @list_item = ListItem.new(list_item_params)
    @list_item.build_item
   if @list_item.save
     redirect_to list_item_path(@list_item)
   else
     render :new
   end
  end

  def show
    set_list_item
  end

  def edit
    set_list_item
  end

  def update
    set_list_item
    @list_item.build_item
    if @list_item.update(list_item_params)
      redirect_to list_item_path(@list_item)
    else
      render :edit
    end
  end

  def index
    if @list = List.find_by_id(params[:list_id])
      @list_items = @list.list_items
    else
      @list_items = ListItem.all
    end
  end

  def destroy
   set_list_item
   @list_item.destroy
   redirect_to list_items_path
  end

  private

  def set_list_item
    @list_item = ListItem.find_by_id(params[:id])
  end

  def list_item_params
    params.require(:list_item).permit(:list_id, :item_id, :content)
  end
end
