class CreateAnnontations < ActiveRecord::Migration
  def change
    create_table :annontations do |t|
      t.integer :parson_id
      t.string :dscription
      t.integer :user_id
      t.integer :location

      t.timestamps
    end
  end
end
