class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :proyect
  
  validates_presence_of :task_id
  validates_presence_of :user_id
end
