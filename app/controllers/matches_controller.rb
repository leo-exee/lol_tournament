class MatchesController < ApplicationController
  before_action :set_match, only: %i[ show edit update destroy ]
  before_action :require_admin, only: [ :new, :create, :edit, :update, :destroy ]


  # GET /matches or /matches.json
  def index
    @matches = Match.order(date: :desc)
  end


  # GET /matches/1 or /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @teams = Team.all
  end

  # GET /matches/1/edit
  def edit
    @teams = Team.all
  end

  # POST /matches or /matches.json
  def create
    @match = Match.new(match_params)
    @teams = Team.all

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: "Match was successfully created." }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1 or /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: "Le match a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @match }
      else
        @teams = Team.all  # Assure-toi que @teams est initialisé même en cas d'erreur
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /matches/1 or /matches/1.json
  def destroy
    @match.destroy!

    respond_to do |format|
      format.html { redirect_to matches_path, status: :see_other, notice: "Match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def match_params
      params.expect(match: [ :team1_id, :team2_id, :date ])
    end
end
