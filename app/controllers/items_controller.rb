class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.create(item_params)
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
