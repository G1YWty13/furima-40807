class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :sendday

  belongs_to :user
  has_one :deal
  has_one_attached :image

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :sendday_id
  end

  with_options presence: true do
    validates :name
    validates :information
    validates :image
    validates :price, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9_999_999
    }
  end
end
