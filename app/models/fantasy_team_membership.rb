class FantasyTeamMembership < ApplicationRecord
  belongs_to :player
  belongs_to :fantasy_team

  def is_backup
    whole_pos =~ /B$/
  end
end