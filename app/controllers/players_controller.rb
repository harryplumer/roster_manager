class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :set_team
  #GET /team/:teamid/players
  def index
    @players = @team.players
  end

  #GET /team/player/:id
  def show
  end

  #GET /team/players/new
  def new
    @player = @team.players.new
  end

  #GET /players/:id/edit
  def edit
  end

  #POST /players
  def create
    @player = @team.players.new(player_params)
    if @player.save
      redirect_to @team, notice: "Player Created"
    else
      render :new
    end
  end 

  #PUT /players/:id
  def update
    if @player.update(player_params)
      redirect_to @team, notice: 'Player Updated'
    else
      render :edit
    end
  end
  
  #DELETE /players/:id
  def destroy
    @player.destroy
    redirect_to @team, notice: "Player Destroyed"
  end

  private

    def set_team
      @team = Team.find(params[:team_id])
    end 

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:first_name, :last_name, :position)
    end
end
