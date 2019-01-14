class FantasyTeamsController < ApplicationController
  def index
    @fantasy_teams = FantasyTeam.all
  end

  def show
    @fantasy_team = FantasyTeam.find(params[:id])
  end

  def for_week
    @week_number = params[:week_number].to_i
    @fantasy_team = FantasyTeam.find(params[:id])
    @players_for_week = @fantasy_team.players_and_score_for_week(@week_number)
    @total = @players_for_week.map{|player, info| info[:score]}.sum
  end
end