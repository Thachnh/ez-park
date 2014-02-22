class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :address
      t.integer :limit
      t.integer :count
      t.integer :fromDay
      t.integer :toDay
      t.integer :fromHour
      t.integer :toHour
      t.integer :status

      t.timestamps
    end
  end
end
