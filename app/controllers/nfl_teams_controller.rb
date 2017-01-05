class NflTeamsController < ApplicationController
  def index
    @nfl_teams = NflTeam.all
  end

  def show
    @nfl_team = NflTeam.find(params[:id])
  end
end