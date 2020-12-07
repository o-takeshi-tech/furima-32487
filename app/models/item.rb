class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_deliver
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  validates :price, presence: true, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9,999,999, message: 'Out of setting range' }
  validates :prefecture_id, presence: { message: 'Select' }

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :day_to_deliver_id
    validates :delivery_fee_id
    validates :status_id
  end
end
