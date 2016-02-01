class AddAprovedToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :approved, :boolean, :default => false
  end
end
