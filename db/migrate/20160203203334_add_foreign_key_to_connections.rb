class AddForeignKeyToConnections < ActiveRecord::Migration
  def change
    add_foreign_key :connections, :users, column: :teacher_id, primary_key: "id"
    add_foreign_key :connections, :users, column: :student_id, primary_key: "id"
  end
end
