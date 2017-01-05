class AddGamesAndGameScores < ActiveRecord::Migration[5.0]
  def change
    create_table :game_scores do |t|
      t.integer :passing_tds
      t.integer :receiving_tds
      t.integer :rushing_tds

      t.integer :yards_passing
      t.integer :yards_receiving
      t.integer :yards_rushing

      t.integer :player_id
      t.integer :game_id
    end

    create_table :games do |t|
      t.integer :home_team_id
      t.integer :visiting_team_id
      t.datetime  :game_time
    end
  end
end
