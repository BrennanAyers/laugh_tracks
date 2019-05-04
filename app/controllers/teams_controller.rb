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
end
