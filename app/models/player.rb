class Player < ApplicationRecord
  belongs_to :team

  ROLES = ["Top laner", "Jungler", "Mid laner", "ADC", "Support"]

  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: ROLES }
  validate :team_must_have_less_than_five_players, on: [:create, :update]

  private

  def team_must_have_less_than_five_players
    if team.present? && team.players.count >= 5
      errors.add(:team, ": #{team.name} ne peut pas avoir plus de 5 joueurs")
    end
  end
end