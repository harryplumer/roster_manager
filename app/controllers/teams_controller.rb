class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
  #GET /teams
  def index
    @teams = Team.all
  end

  #GET /team/:id
  def show
  end

  #GET /teams/new
  def new
    @teams = Team.new
  end

  #GET /teams/:id/edit
  def edit
  end

  #POST /teams
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: "Team Created"
    else
      render :new
    end
  end 

  #PUT /teams/:id
  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team Updated'
    else
      render :edit
    end
  end
  
  #DELETE /teams/:id
  def destroy
    @team.destroy
    redirect_to teams_url, notice: "Team Destroyed"
  end
  
  
  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end