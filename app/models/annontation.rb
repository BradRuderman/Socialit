class Annontation < ActiveRecord::Base
  attr_accessible :description, :start_location, :end_location, :parson_id, :user_id, :paragraph
  belongs_to :book
  belongs_to :user
end
