class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_address = PurchaseRecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_records_params)
    if @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_records_params
    params.require(:purchase_record_address).permit(:area_id, :municipality, :address, :building, :postal_code, :tell).merge(user_id: current_user.id, item_id: params[:item_id] )
  end
end
