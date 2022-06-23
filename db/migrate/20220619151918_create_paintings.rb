class CreatePaintings < ActiveRecord::Migration[7.0]
  def change
    create_table :paintings do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :order

      t.timestamps
    end
  end
end
