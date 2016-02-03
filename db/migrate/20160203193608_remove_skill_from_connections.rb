class RemoveSkillFromConnections < ActiveRecord::Migration
  def change
    remove_column :connections, :skill_id, :integer
  end
end
