class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :area
  belongs_to :scheduled
  belongs_to :user
  validates :image, :item_name, :content, :price, presence: true
  validates :price, numericality: {less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300, only_integer: true}
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_id, numericality: { other_than: 1 , message: "can't be blank"}
end