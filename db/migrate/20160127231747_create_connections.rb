class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.belongs_to :skill, index: true, foreign_key: true
      t.belongs_to :teacher, index: true #add foreign key constraints later
      t.belongs_to :student, index: true

      t.timestamps null: false
    end
  end
end
