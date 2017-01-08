class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def active
    @players = Player.all.reject(&:is_out?)
    render :index
  end

  def show
    @player = Player.find(params[:id])
  end
end