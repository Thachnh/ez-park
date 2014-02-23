class AddMeterNumberToMeters < ActiveRecord::Migration
  def change
    add_column :meters, :meter_number, :string
  end
end
