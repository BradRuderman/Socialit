class Book < ActiveRecord::Base
  attr_accessible :author, :description, :price, :title, :image_url, :pearson_id
  belongs_to :user
end
