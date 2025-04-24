class PagesController < ApplicationController
  def home
    @recent_played_matches = Match
      .joins(:result)
      .order(date: :desc)
      .limit(5)

    @upcoming_matches = Match
      .left_joins(:result)
      .where(results: { id: nil })
      .order(date: :asc)
      .limit(5)

    @top_teams = Team
      .left_joins(:wins)
      .group(:id)
      .select("teams.*, COUNT(results.id) as wins_count")
      .order("wins_count DESC")
      .limit(3)
  end
end
