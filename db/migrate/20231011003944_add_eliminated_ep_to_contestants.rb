class AddEliminatedEpToContestants < ActiveRecord::Migration[7.1]
  def change
    add_column :contestants, :eliminated_ep, :integer
  end
end
