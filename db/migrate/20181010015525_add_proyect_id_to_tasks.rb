class AddProyectIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :proyect_id,  :integer, :default => 0
  end
end
