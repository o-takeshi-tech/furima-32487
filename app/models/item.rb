class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day_to_deliver
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status


  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  validates :price, presence: true, numericality: { only_integer: true, message: 'Half-width number'} 
  validates :price, numericality: { greater_than_or_equal_to: 300, message: 'Out of setting range'}

  with_options presence: true, numericality: { other_than: 1, message: 'Select' }  do
    validates :category_id
    validates :day_to_deliver_id
    validates :prefecture_id
    validates :delivery_fee_id
    validates :status_id
  end
end
