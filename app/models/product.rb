class Product
  include MongoMapper::Document

  key :title,		String
  key :description, 	String
  key :price,		Float
  key :photo,		String
end
