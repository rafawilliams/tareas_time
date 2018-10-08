class CreateTimeEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :time_entries do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :task_id
      t.integer :duracion
      t.datetime :start_time

      t.timestamps
    end
  end
end
