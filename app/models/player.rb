class Player < ApplicationRecord
  belongs_to :team

  ROLES = [ "Top laner", "Jungler", "Mid laner", "ADC", "Support" ]

  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: ROLES }
  validate :team_must_have_less_than_five_players, on: [ :create, :update ]

  def role_icon
    case role
    when "Top laner"
      "https://static.wikia.nocookie.net/leagueoflegends/images/0/0a/Top_Laner_icon.png"
    when "Jungler"
      "https://static.wikia.nocookie.net/leagueoflegends/images/1/17/Jungle_Laner_icon.png"
    when "Mid laner"
      "https://static.wikia.nocookie.net/leagueoflegends/images/4/45/Mid_Laner_icon.png"
    when "ADC"
      "https://static.wikia.nocookie.net/leagueoflegends/images/c/c6/ADC_Laner_icon.png"
    when "Support"
      "https://static.wikia.nocookie.net/leagueoflegends/images/6/6d/Support_Laner_icon.png"
    else
      "https://via.placeholder.com/150"
    end
  end

  private

  def team_must_have_less_than_five_players
    if team.present? && team.players.count >= 5
      errors.add(:team, ": #{team.name} ne peut pas avoir plus de 5 joueurs")
    end
  end
end
