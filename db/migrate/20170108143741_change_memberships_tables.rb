class ChangeMembershipsTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :team_memberships
    create_table :fantasy_team_memberships do |t|
      t.integer :player_id
      t.integer :fantasy_team_id
    end
    create_table :nfl_team_memberships do |t|
      t.integer :player_id
      t.integer :nfl_team_id
    end
  end
end
