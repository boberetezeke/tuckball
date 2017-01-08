class AddToScores < ActiveRecord::Migration[5.0]
  def change
    add_column :game_scores, :passing_ints, :integer
    add_column :game_scores, :fumbles, :integer
    add_column :game_scores, :passing_2pt, :integer
    add_column :game_scores, :receiving_2pt, :integer
    add_column :game_scores, :rushing_2pt, :integer
    add_column :game_scores, :fg_0_39, :integer
    add_column :game_scores, :fg_40_49, :integer
    add_column :game_scores, :fg_50_plus, :integer
    add_column :game_scores, :ext_pt, :integer
    add_column :game_scores, :fg_miss, :integer
  end
end
