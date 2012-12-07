class Order
  include Mongoid::Document
  has_many :line_items

  field :name, :type => String
  field :address, :type => String
  field :email, :type => String
end
