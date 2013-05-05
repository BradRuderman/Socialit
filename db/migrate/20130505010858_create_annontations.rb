class CreateAnnontations < ActiveRecord::Migration
  def change
    create_table :annontations do |t|
      t.string :pearson_id
      t.string :description
      t.integer :user_id
      t.integer :start_location
      t.integer :end_location
      t.integer :book_id
      t.integer :paragraph
      
      t.timestamps
    end
  end
end
