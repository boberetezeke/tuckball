class AddPlayersAndTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :type
    end

    create_table :players do |t|
      t.string :name
      t.string :position
    end

    create_table :team_memberships do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end
end
