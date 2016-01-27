class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.datetime :date_time
      t.belongs_to :connection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
