class GameScore < ApplicationRecord
  belongs_to :game
  belongs_to :player

  scope :on_week, ->(week_number) { GameScore.joins(:game).merge(Game.on_week(week_number)) }

  STATS = {
    passing_tds:      ->(tds)  { tds * 4    },
    receiving_tds:    ->(tds)  { tds * 6    },
    rushing_tds:      ->(tds)  { tds * 6    },
    yards_passing:    ->(yds)  { (yds / 25) },
    yards_receiving:  ->(yds)  { (yds / 10) },
    yards_rushing:    ->(yds)  { (yds / 10) },
    passing_ints:     ->(ints) { ints * -2  },
    fumbles:          ->(fmbl) { fmbl * -2  },
    passing_2pt:      ->(pts)  { pts        },
    receiving_2pt:    ->(pts)  { pts * 2    },
    rushing_2pt:      ->(pts)  { pts * 2    },
    fg_0_39:          ->(fgs)  { fgs * 3    },
    fg_40_49:         ->(fgs)  { fgs * 4    },
    fg_50_plus:       ->(fgs)  { fgs * 5    },
    ext_pt:           ->(pts)  { pts        },
    fg_miss:          ->(fgs)  { fgs * -1   }
  }

  STATS.each_key do |stat|
    define_method("#{stat}_score") do
      STATS[stat].call(self.send(stat))
    end

    define_method("#{stat}_display") do
      value = self.send(stat)
      if value != 0
        "#{value} <strong>#{self.send(stat.to_s+'_score')}</strong>".html_safe
      else
        value
      end
    end
  end

  def score
    score = 0
    STATS.each_key do |stat|
      score += STATS[stat].call(self.send(stat))
    end
    score
  end

  def week_number
    game.week_number
  end
end