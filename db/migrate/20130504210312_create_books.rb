class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.string :description
      t.string :image_url
      t.string :pearson_id
      t.integer :user_id

      t.timestamps
    end
  end
end
