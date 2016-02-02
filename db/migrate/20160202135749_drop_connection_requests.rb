class DropConnectionRequests < ActiveRecord::Migration
  def change
    drop_table :connection_requests
  end
end
