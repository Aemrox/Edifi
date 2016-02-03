class AddSkillToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :skill_id, :integer
    add_foreign_key :lessons, :skills
  end
end
