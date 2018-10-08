class Proyect < ApplicationRecord
    validates :nombre, presence: true
    has_many :time_entries, dependent: :destroy
    belongs_to :user
end
