class AddSeasonToContestants < ActiveRecord::Migration[7.1]
  def change
    add_reference :contestants, :season, index: true, foreign_key: true
  end
end
