puts "🔄 Nettoyage de la base..."
Player.destroy_all
Team.destroy_all
Match.destroy_all
Result.destroy_all

puts "✅ Création des équipes..."
team1 = Team.create!(name: "Team Phoenix")
team2 = Team.create!(name: "Team Hydra")

puts "✅ Création des joueurs..."
roles = ["Top laner", "Jungler", "Mid laner", "ADC", "Support"]

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
match = Match.create!(team1: team1, team2: team2, date: DateTime.now)

puts "✅ Création d'un résultat..."
Result.create!(match: match, winning_team: team1, team1_score: 12, team2_score: 8)

puts "🌱 Seed terminé !"
