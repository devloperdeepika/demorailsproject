class CreateBuystocks < ActiveRecord::Migration[6.1]
  def change
    create_table :buystocks do |t|
      t.belongs_to :user
      t.belongs_to :stock

      t.timestamps
    end
  end
end
