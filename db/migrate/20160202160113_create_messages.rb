class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :parent_message, index: true
      t.boolean :read, default: false
      t.belongs_to :sender, index: true
      t.belongs_to :receiver, index: true
      t.timestamps null: false
    end
  end
end


