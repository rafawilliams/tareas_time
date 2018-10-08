class Task < ApplicationRecord
    belongs_to :user
    has_many :time_entry, dependent: :destroy
    validates_presence_of :user_id, :nombre
    accepts_nested_attributes_for :time_entry
end
