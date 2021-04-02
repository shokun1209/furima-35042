class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :area_id, :municipality, :address, :building, :postal_code, :tell, :purchase_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :area_id
    validates :municipality
    validates :address
    validates :purchase_record_id
    validates :tell, format: {with: /\A\d{11}\z/} #11桁数字 ハイフン無し
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} #数字のみ ハイフン有り
  end
end