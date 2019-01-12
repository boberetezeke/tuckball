class AddBackupToFantasyTeamMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :fantasy_team_memberships, :whole_pos, :string
  end
end
