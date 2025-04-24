class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :require_admin, only: [ :new, :create, :edit, :update, :destroy ]

  # GET /players or /players.json
  def index
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
    @teams = Team.all
    @roles = Player::ROLES
    if @teams.empty?
      flash[:alert] = "Il n'y a pas d'équipe disponible. Veuillez créer une équipe avant d'ajouter un joueur."
      redirect_to teams_path
    end
  end

  # GET /players/1/edit
  def edit
    @teams = Team.all
    @roles = Player::ROLES
    if @teams.empty?
      flash[:alert] = "Il n'y a pas d'équipe disponible. Veuillez créer une équipe avant d'ajouter un joueur."
      redirect_to teams_path
    end
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)
    @teams = Team.all
    @roles = Player::ROLES

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: "Le joueur a été créé avec succès." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    @teams = Team.all
    @roles = Player::ROLES

    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: "Le joueur a été mis à jour avec succès." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy!

    respond_to do |format|
      format.html { redirect_to players_path, status: :see_other, notice: "Le joueur a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:first_name, :last_name, :role, :team_id)
    end
end
