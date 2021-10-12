class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :price
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
