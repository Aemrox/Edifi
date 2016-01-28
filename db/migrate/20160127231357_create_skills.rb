class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.belongs_to :subject, index: true #add foreign key constraints later

      t.timestamps null: false
    end
  end
end
