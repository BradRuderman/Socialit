class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.string :description
      t.string :image_url


      t.timestamps
    end
  end
end
