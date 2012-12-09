class ShoppingCart
  include Mongoid::Document
  field :items, :type => Collection
end
