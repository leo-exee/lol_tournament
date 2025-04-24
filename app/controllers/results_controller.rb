class ResultsController < ApplicationController
  before_action :set_match, only: %i[ create ]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

  # POST /results or /results.json
  def create
    if @match.result
      redirect_to @match, alert: "Ce match a déjà un résultat." and return
    end


    @result = Result.new
    @result.match = @match

    @result.team1_score = rand(0..10)
    @result.team2_score = rand(0..10)

    @result.winning_team = if @result.team1_score > @result.team2_score
      @match.team1
    elsif @result.team1_score < @result.team2_score
      @match.team2
    else
      nil
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
