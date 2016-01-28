class CreateTeacherSkills < ActiveRecord::Migration
  def change
    create_table :teacher_skills do |t|
      t.references :teacher, index: true #Add foreign key constraint
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
