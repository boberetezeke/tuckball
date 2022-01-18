class AddWeeksOut < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :weeks_out, :string
  end
end
