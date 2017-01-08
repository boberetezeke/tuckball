class Game < ApplicationRecord
  belongs_to :home_team,      foreign_key: 'home_team_id',      class_name: 'NflTeam'
  belongs_to :visiting_team,  foreign_key: 'visiting_team_id',  class_name: 'NflTeam'

  has_many :game_scores

  def name
    "#{visiting_team.name} vs. #{home_team.name}"
  end

  def lost_game?(nfl_team)
    (nfl_team == home_team      && home_team_score < visiting_team_score) ||
    (nfl_team == visiting_team  && home_team_score > visiting_team_score)
  end
end