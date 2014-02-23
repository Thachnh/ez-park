class AddNumberToMeters < ActiveRecord::Migration
  def change
    add_column :meters, :number, :string
  end
end
