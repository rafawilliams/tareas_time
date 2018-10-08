class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :nombre
      t.integer :user_id

      t.timestamps
    end
    add_index :tasks, :nombre, unique: true
  end
end
