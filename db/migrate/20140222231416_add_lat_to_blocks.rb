class AddLatToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :lat, :float
  end
end
