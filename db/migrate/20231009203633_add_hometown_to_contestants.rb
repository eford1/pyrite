class AddHometownToContestants < ActiveRecord::Migration[7.1]
  def change
    add_column :contestants, :hometown, :string
  end
end
