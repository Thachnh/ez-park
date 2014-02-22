class CreateMeters < ActiveRecord::Migration
  def change
    create_table :meters do |t|
      t.float :lat
      t.float :long
      t.integer :block_id
      t.float :rate
      t.integer :status

      t.timestamps
    end
  end
end
