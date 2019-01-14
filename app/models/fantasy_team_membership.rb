class FantasyTeamMembership < ApplicationRecord
  belongs_to :player
  belongs_to :fantasy_team

  def is_backup
    whole_pos =~ /B$/
  end

  WHOLE_POS_TO_POS = {
    "QB" =>   "QB",
    "QBB" =>  "QB",
    "RB1" =>  "RB",
    "RB2" =>  "RB",
    "RBB" =>  "RB",
    "WR1" =>  "WR",
    "WR2" =>  "WR",
    "WRB" =>  "WR",
    "TE1" =>  "TE",
    "TEB" =>  "TE",
    "K" =>    "K",
    "KB" =>   "K",
  }
  def pos
    WHOLE_POS_TO_POS[whole_pos]
  end
end