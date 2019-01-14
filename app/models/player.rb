class Player < ApplicationRecord
  has_many :fantasy_team_memberships
  has_many :fantasy_teams, through: :fantasy_team_memberships

  has_many :nfl_team_memberships
  has_many :nfl_teams, through: :nfl_team_memberships

  has_many :game_scores

  default_scope ->{ order(:name) }

  def score
    game_scores.map(&:score).sum
  end

  def score_for_week(week_number)
    game_scores.on_week(week_number).map(&:score).sum
  end

  POSITION_VIEW_ORDER = {
      "QB" =>  0,
      "QBB" => 1,
      "RB"  => 2,
      "RB1" => 2,
      "RB2" => 3,
      "RBB" => 4,
      "WR"  => 5,
      "WR1" => 5,
      "WR2" => 6,
      "WRB" => 7,
      "TE" =>  8,
      "TEB" => 9,
      "K" =>   10,
      "KB" =>  11
  }

  def self.position_view_order(position)
    POSITION_VIEW_ORDER[position]
  end

  def position_view_order
    POSITION_VIEW_ORDER[position]
  end

  def nfl_team
    nfl_teams.first
  end

  def is_out?
    nfl_team.is_out?
  end

  def out_in_week?(week_number)
    team_out_in_week?(week_number) # || injured_in_weeks.where(week_number: week_number)
  end

  def team_out_in_week?(week_number)
    nfl_teams.first.out_in_week?(week_number)
  end

  def games_played
    game_scores.count
  end
end