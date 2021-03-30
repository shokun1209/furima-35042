class ItemsController < ApplicationController
  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :shipping_id, :area_id, :days_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
