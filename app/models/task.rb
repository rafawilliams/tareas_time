class Task < ApplicationRecord
    belongs_to :user
    belongs_to :proyect, optional: true 
    validates_presence_of :user_id, :nombre, :duracion, :fecha_inicio, :hora_inicio
end
