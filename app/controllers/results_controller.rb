class ResultsController < ApplicationController
  before_action :set_match, only: %i[ create ]

  # POST /results or /results.json
  def create
    if @match.result
      redirect_to @match, alert: "Ce match a déjà un résultat." and return
    end

    winning_team = [ @match.team1_id, @match.team2_id ].sample

    @result = Result.new
    @result.match = @match
    @result.winning_team_id = winning_team

    if @result.winning_team_id == @match.team1_id
      @result.team1_score = rand(4..8)
      @result.team2_score = rand(0..4)
    else
      @result.team1_score = rand(0..4)
      @result.team2_score = rand(4..8)
    end

    respond_to do |format|
      if @result.save
        format.html { redirect_to @match, notice: "Le résultat a été créé avec succès." }
      else
        format.html { redirect_to @match, alert: "Erreur lors de la création du résultat." }
      end
    end
  end


  private
    def set_result
      @result = Result.find(params[:id])
    end

    def set_match
      @match = Match.find(params[:match_id])
    end

    def result_params
      params.require(:result).permit(:match_id)
    end
end
