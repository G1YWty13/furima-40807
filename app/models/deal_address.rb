class DealAddress
  include ActiveModel::Model
  attr_accessor :housenumber, :prefecture_id, :town, :street, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :housenumber, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :town
    validates :street
    validates :phone, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    deal = Deal.create(user_id:, item_id:)
    Address.create(housenumber:, prefecture_id:, town:, street:, building:,
                   phone:, deal_id: deal.id)
  end
end
