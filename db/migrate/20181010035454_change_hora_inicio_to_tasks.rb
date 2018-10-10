class ChangeHoraInicioToTasks < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :hora_inicio,  :string
    change_column :tasks, :fecha_fin,  :datetime
  end
end
