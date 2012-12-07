class Product
  include MongoMapper::Document

  has_many :line_items

  key :title,		String
  key :description, 	String
  key :price,		Float
  key :photo,		String
end
