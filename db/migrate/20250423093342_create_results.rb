class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.references :match, null: false, foreign_key: true
      t.references :winning_team, null: false, foreign_key: { to_table: :teams }
      t.integer :team1_score
      t.integer :team2_score

      t.timestamps
    end
  end
end
