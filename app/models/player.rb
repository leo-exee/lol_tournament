class Player < ApplicationRecord
  belongs_to :team

  ROLES = ["Top laner", "Jungler", "Mid laner", "ADC", "Support"]

  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: ROLES }
end
