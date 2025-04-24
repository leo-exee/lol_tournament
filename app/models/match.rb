class Match < ApplicationRecord
  belongs_to :team1, class_name: 'Team'
  belongs_to :team2, class_name: 'Team'
  has_one :result, dependent: :destroy

  validates :team1, :team2, :date, presence: true
  validate :teams_must_be_different
  validate :teams_ready
  validate :date_cannot_be_in_the_past

  def teams_must_be_different
    if team1 == team2
      errors.add(:base, "Un match doit opposer deux équipes différentes")
    end
  end

  def teams_ready
    if team1.players.empty? || team2.players.empty?
      errors.add(:base, "Chaque équipe doit avoir au moins un joueur")
    end
  end
  def date_cannot_be_in_the_past
    if date.present? && date < Time.current
      errors.add(:base, "La date ne peut pas être dans le passé")
    end
  end
end
