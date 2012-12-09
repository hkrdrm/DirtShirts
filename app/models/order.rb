class Order
  include Mongoid::Document

  embeds_many :line_items

  field :name, :type => String
  field :address, :type => String
  field :address2, :type => String
  field :city, :type => String
  field :state, :type => String
  field :zipcode, :type => Integer 
  field :country, :type => String
  field :email, :type => String
  field :shipped, :type => Boolean


  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end
end
