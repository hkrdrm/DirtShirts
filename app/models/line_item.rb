class LineItem
  include Mongoid::Document

  field :product_id, :type => Integer
  field :order_id, :type => Integer
  field :quantity, :type => Integer
  field :total_price, :type => Float
end
