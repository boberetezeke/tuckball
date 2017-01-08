class AddScoresToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :home_team_score, :integer
    add_column :games, :visiting_team_score, :integer
  end
end
