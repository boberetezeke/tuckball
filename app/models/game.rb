class Game < ApplicationRecord
  belongs_to :home_team,      foreign_key: 'home_team_id',      class_name: 'NflTeam'
  belongs_to :visiting_team,  foreign_key: 'visiting_team_id',  class_name: 'NflTeam'

  has_many :game_scores, dependent: :destroy

  default_scope ->{ order('game_time ASC') }

  WEEKS = [
    { start_time: Time.utc(2023,1,15),   end_time: Time.utc(2023,1,18),  week_number: 1 },
    { start_time: Time.utc(2023,1,22),  end_time: Time.utc(2023,1,24), week_number: 2  },
    { start_time: Time.utc(2023,1,29),  end_time: Time.utc(2023,1,31), week_number: 3  },
    { start_time: Time.utc(2023,2,12),  end_time: Time.utc(2023,2,14), week_number: 4  },
  ]

  scope :on_week, ->(week_number) {
    week_bounds = WEEKS[week_number - 1]
    where(Game.arel_table[:game_time].gt(week_bounds[:start_time]).and(Game.arel_table[:game_time].lt(week_bounds[:end_time])))
  }

  def week_number
    WEEKS.select do |week|
      puts "week - #{week}, game_time = #{game_time}"
      r = game_time >= week[:start_time] && game_time <= week[:end_time]
      puts r
      r
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
