class TeamsController < ApplicationController
  def index
    if params.include?(:age)
      @teams = Team.by_age(params[:age])
      @average_age = @teams.average_age
      @team_locations = @teams.locations
    else
      @teams = Team.all
      @average_age = Team.average_age
      @team_locations = Team.locations
    end
  end

  def new
    @new_team = Team.new
  end

  def create
    Team.create(team_params)
    redirect_to "/teams"
  end

  private

  def team_params
    params.require(:team).permit(:name, :age, :location)
  end
end
