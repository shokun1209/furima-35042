class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_validates, only:[:index, :create]
  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_records_params)
    if @purchase_record_address.valid?
      set_pay
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_validates
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def purchase_records_params
    params.require(:purchase_record_address).permit(:area_id, :municipality, :address, :building, :postal_code, :tell).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_records_params[:token],
      currency: 'jpy'
    )
  end
end
