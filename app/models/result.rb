class Result < ApplicationRecord
  belongs_to :match
  belongs_to :winning_team, class_name: "Team"

  validates :team1_score, :team2_score, presence: true, numericality: { only_integer: true }

  validate :winner_is_correct

  def winner_is_correct
    unless [ match.team1, match.team2 ].include?(winning_team)
      errors.add(:winning_team, "L'équipe gagnante doit participer au match")
    end
  end
end
