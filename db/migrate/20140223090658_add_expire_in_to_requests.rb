class AddExpireInToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :expire_in, :timestamp
  end
end
