class LineItem
  include Mongoid::Document


  field :product_id, :type => Integer
  field :order_id, :type => Integer
  field :title, :type => String
  field :quantity, :type => Integer
  field :total_price, :type => Float
  field :photo, :type => String

  def self.from_cart_item(cart_item)
    li = self.new
    li.title = cart_item.title
    li.quantity = cart_item.quantity
    li.total_price = cart_item.price
    li.photo = cart_item.photo
    li
  end
end
