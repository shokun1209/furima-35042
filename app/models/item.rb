class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  validates :name, presence: true ,length: {maximum:40}
  validates :text, presence: true ,length: {maximum:1000}
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  validates :image, presence: true
  validates :category_id, numericality: { other_than:1}
end
