class AddRateToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :rate, :float
  end
end
