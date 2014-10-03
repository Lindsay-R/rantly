class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.integer :user_id
      t.string :title
      t.text :verbage
      t.timestamps
    end
  end
end
