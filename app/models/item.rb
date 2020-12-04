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

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :day_to_deliver_id
    validates :delivery_fee_id
    validates :status_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :category_id
    validates :day_to_deliver_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :status_id
  end

end
