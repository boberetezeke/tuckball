class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @kicker_game_scores, @non_kicker_game_scores = @game.game_scores.partition{|game_score| game_score.player.position == "K"}
  end
end