class Game < ApplicationRecord
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Team'
  belongs_to :visiting_team, foreign_key: 'visiting_team_id', class_name: 'Team'

  has_many :game_scores

  def name
    "#{visiting_team.name} vs. #{home_team.name}"
  end
end