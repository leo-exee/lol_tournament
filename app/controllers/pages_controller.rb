class PagesController < ApplicationController
  def home
    @recent_matches = Match.order(date: :desc).limit(5)

    @top_teams = Team
      .left_joins(:wins)
      .group(:id)
      .select("teams.*, COUNT(results.id) as wins_count")
      .order("wins_count DESC")
      .limit(3)
  end
end
