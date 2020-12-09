class OrderAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ , message: "Input correctly"}
    validates :city
    validates :address_line
    validates :phone_number, length: { maximum: 11 }
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "Select"}
    validates :phone_number, numericality: {only_integer: true, message: " Input only number"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, order_id: order.id)
  end

end 
