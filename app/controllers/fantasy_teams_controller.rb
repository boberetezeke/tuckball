class FantasyTeamsController < ApplicationController
  def index
    @fantasy_teams = FantasyTeam.all
  end

  def show
    @fantasy_team = FantasyTeam.find(params[:id])
  end
end