class NflTeamMembership < ApplicationRecord
  belongs_to :player
  belongs_to :nfl_team
end