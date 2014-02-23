class RemoveNumberFromMeters < ActiveRecord::Migration
  def change
    remove_column :meters, :number, :string
  end
end
