class Admin::ItemsController < ApplicationController
  def index
    @items = Item.search(params[:search])
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(items_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  private
  def items_params
    params.require(:item).permit(:name,:caption,:image,:tax_excluded_price,:genre_id,:is_sales_active,:search)
  end
  
end
