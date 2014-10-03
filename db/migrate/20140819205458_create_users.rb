class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.string :rant_rate
      t.string :password_digest

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
