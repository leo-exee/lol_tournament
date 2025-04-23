class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :home_matches, class_name: 'Match', foreign_key: 'team1_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'team2_id'
  has_many :wins, class_name: 'Result', foreign_key: 'winning_team_id'

  validates :name, presence: true, uniqueness: true

  validate :max_five_players

  def max_five_players
    if players.size > 5
      errors.add(:players, "Une équipe ne peut pas avoir plus de 5 joueurs")
    end
  end
end
