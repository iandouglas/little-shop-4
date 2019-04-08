class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  belongs_to :user
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :image_url
  validates_presence_of :quantity
  validates_presence_of :base_price

  def merchant_name
   user.name
  end

  def avg_f_time
    Item.joins(:order_items)
    .where(id: self.id)
    .group(:id)
    .pluck("avg(order_items.updated_at - order_items.created_at) as avg_f_time").first
  end
end
