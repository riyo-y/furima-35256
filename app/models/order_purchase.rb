class OrderPurchase
  include ActiveModel::Model
  attr_accessor :postcode, :admins_information_id, :city, :block, :building, :phone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :admins_information_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, length: { maximum: 11 }, numericality: true
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :building

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(postcode: postcode, admins_information_id: admins_information_id, city: city, block: block,
                    building: building, phone_number: phone_number, order_id: order.id)
  end
end
