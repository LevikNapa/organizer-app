class ListsController < ApplicationController
    # before_action :check_for_logged_in, except: [:index]

  def new
    @list = List.new
    @items = @list.items.build
    @items.list_items.build
  end

  def create
    # binding.pry
    @list = List.new(list_params)
    render json: @list
  end

  def index
    @lists = List.all
		respond_to do |f|
			f.html {render :index}
			f.json {render json: @lists}
		end
  end

  def show
    set_list
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @list }
    end
  end

  private

  def set_list
    @list = List.find_by_id(params[:id])
    if !@list
      redirect_to lists_path
    end
  end

  def list_params
    params.require(:list).permit(:title, :date, items_attributes: [:id, :description, list_items_attributes: [:id, :content]])
  end
end
