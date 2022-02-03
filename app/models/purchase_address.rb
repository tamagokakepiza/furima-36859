class PurchaseAddress
  attr_accessor :token, :post_code, :area_id, :municipality, :address, :room_number, :phone_number, :user_id, :item_id

  include ActiveModel::Model

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, address: address,
                   room_number: room_number, phone_number: phone_number, purchase_id: purchase.id)
  end
end
