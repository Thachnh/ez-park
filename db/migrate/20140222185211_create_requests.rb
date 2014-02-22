class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :meter_id
      t.timestamp :paytime
      t.integer :duration
      t.integer :status

      t.timestamps
    end
  end
end
