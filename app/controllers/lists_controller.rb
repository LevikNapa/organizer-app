class ListsController < ApplicationController
  def new
    @list = List.new
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
    @lists = List.all
  end

  def show

    @list = List.find(params[:id])
    if !@list
      redirect_to list_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :date, :user_id)
  end
end
