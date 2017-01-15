class Game < ApplicationRecord
  belongs_to :home_team,      foreign_key: 'home_team_id',      class_name: 'NflTeam'
  belongs_to :visiting_team,  foreign_key: 'visiting_team_id',  class_name: 'NflTeam'

  has_many :game_scores, dependent: :destroy

  WEEKS = [
    { start_time: Time.utc(2017,1,6),   end_time: Time.utc(2017,1,9),  week_number: 1 },
    { start_time: Time.utc(2017,1,13),  end_time: Time.utc(2017,1,16), week_number: 2  },
    { start_time: Time.utc(2017,1,20),  end_time: Time.utc(2017,1,23), week_number: 3  },
    { start_time: Time.utc(2017,1,27),  end_time: Time.utc(2017,2,15), week_number: 4  },
  ]

  scope :on_week, ->(week_number) {
    week_bounds = WEEKS[week_number - 1]
    where(Game.arel_table[:game_time].gt(week_bounds[:start_time]).and(Game.arel_table[:game_time].lt(week_bounds[:end_time])))
  }

  def week_number
    WEEKS.select do |week|
      game_time >= week[:start_time] && game_time <= week[:end_time]
    end.first[:week_number]
  end

  def name
    "#{visiting_team.name} vs. #{home_team.name}"
  end

  def lost_game?(nfl_team)
    (nfl_team == home_team      && home_team_score < visiting_team_score) ||
    (nfl_team == visiting_team  && home_team_score > visiting_team_score)
  end
end