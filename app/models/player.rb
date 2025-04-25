class Player < ApplicationRecord
  belongs_to :team

  ROLES = [ "Top laner", "Jungler", "Mid laner", "ADC", "Support" ]

  validates :first_name, :last_name, :role, presence: true
  validates :role, inclusion: { in: ROLES }
  validate :team_must_have_less_than_five_players, on: [ :create, :update ]

  def role_icon
    case role
    when "Top laner"
      "https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-top.png"
    when "Jungler"
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2ec970f4-1706-4915-9a93-41f3d9c8202c/degndao-3803ac5c-8d3b-4205-bdac-17e03fb712dd.png/v1/fill/w_436,h_491/lol_jungle_icon_by_divoras_degndao-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDkxIiwicGF0aCI6IlwvZlwvMmVjOTcwZjQtMTcwNi00OTE1LTlhOTMtNDFmM2Q5YzgyMDJjXC9kZWduZGFvLTM4MDNhYzVjLThkM2ItNDIwNS1iZGFjLTE3ZTAzZmI3MTJkZC5wbmciLCJ3aWR0aCI6Ijw9NDM2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.1QIU7-OGEaPcDPPJbvgfZ1GiMiqTUk3MZsXimMqpK2E"
    when "Mid laner"
      "https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-clash/global/default/assets/images/position-selector/positions/icon-position-middle.png"
    when "ADC"
      "https://cdn3.emoji.gg/emojis/1659_BotLane.png"
    when "Support"
      "https://i.namu.wiki/i/wkBv6sjhYwd14wdE8UX-tL9DWMrvtKuRlqSOZlEoEm3KU8-pShy2BMQvUxPSqLnItXEVfpXCkKV-M77hwwpXxQ.svg"
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
