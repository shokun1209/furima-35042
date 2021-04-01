class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping
  belongs_to_active_hash :delivery
  belongs_to_active_hash :user
  has_one_attached :image

  with_options presence: true do
  validates :name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  validates :image
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
    with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :delivery_id
    end
  end
end
