class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :area_id, :municipality, :address, :building, :postal_code, :tell, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :area_id
    validates :municipality
    validates :address
    validates :tell, format: {with: /\A\d{11}\z/} #11桁数字 ハイフン無し
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/} #数字のみ ハイフン有り
    validates :token
  end

  def save
    record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(area_id: area_id, municipality: municipality, address: address, building: building, postal_code: postal_code, tell: tell, purchase_record_id: record.id)
  end
end