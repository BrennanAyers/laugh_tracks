class TeamsController < ApplicationController
  def index
    if params.include?(:age)
      @teams = Team.by_age(params[:age])
      @average_age = @teams.average_age
      @team_locations = @teams.locations
      @total_player_count = @teams.total_player_count
      @average_player_winrate = @teams.average_player_winrate
    else
      @teams = Team.all
      @average_age = Team.average_age
      @team_locations = Team.locations
      @total_player_count = Team.total_player_count
      @average_player_winrate = Team.average_player_winrate
    end
  end

  def new
    @new_team = Team.new
  end

  def create
    Team.create(team_params)
    redirect_to "/teams"
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, :age, :location)
  end
end
