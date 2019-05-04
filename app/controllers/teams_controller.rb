class TeamsController < ApplicationController
  def index
    if params.include?(:age)
      @teams = Team.by_age(params[:age])
    else
      @teams = Team.all
    end
  end

  def new
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
