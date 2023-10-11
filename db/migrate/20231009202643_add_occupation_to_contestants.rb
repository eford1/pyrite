class AddOccupationToContestants < ActiveRecord::Migration[7.1]
  def change
    add_column :contestants, :occupation, :string
  end
end
