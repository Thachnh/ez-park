class AddLonToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :lon, :float
  end
end
