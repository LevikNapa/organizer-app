class ListsController < ApplicationController
    before_action :check_for_logged_in, except: [:index]

  def new
    @list = List.new
    @list.items.build
  end
  def create
    @list = current_user.lists.build(list_params)
    if @list.save
       redirect_to list_path(@list)
    else
      render :new
    end
  end

  def index
    @lists = List.order_by_date
  end

  def show

    @list = List.find(params[:id])
    if !@list
      redirect_to list_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :date, :user_id, :item_ids, item_attributes: [:description])
  end
end
