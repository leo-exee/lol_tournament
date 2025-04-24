puts "🔄 Nettoyage de la base..."
Result.destroy_all
Match.destroy_all
Player.destroy_all
Team.destroy_all
User.destroy_all

puts "✅ Création des équipes..."
team1 = Team.create!(name: "Team Phoenix")
team2 = Team.create!(name: "Team Hydra")

puts "✅ Création des joueurs..."
roles = [ "Top laner", "Jungler", "Mid laner", "ADC", "Support" ]

5.times do |i|
  Player.create!(
    first_name: "Joueur#{i + 1}",
    last_name: "Alpha",
    role: roles[i],
    team: team1
  )
end

5.times do |i|
  Player.create!(
    first_name: "Joueur#{i + 6}",
    last_name: "Bravo",
    role: roles[i],
    team: team2
  )
end

puts "✅ Création d'un match..."
match = Match.create!(team1: team1, team2: team2, date: 1.day.from_now)

puts "✅ Création d'un résultat..."
Result.create!(match: match, winning_team: team1, team1_score: 12, team2_score: 8)

puts "✅ Création de l'administrateur..."
User.create!(
  email: "admin@admin.fr",
  password: "admin123",
  is_admin: true
)

puts "🌱 Seed terminé !"
