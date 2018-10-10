class AddFechaInicioToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :duracion,  :integer
    add_column :tasks, :fecha_inicio, :date
    add_column :tasks, :hora_inicio,  :time
    add_column :tasks, :fecha_fin,  :datetime
  end
end
