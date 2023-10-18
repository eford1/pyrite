class AddEliminationReasonToContestants < ActiveRecord::Migration[7.1]
  def change
    add_column :contestants, :elimination_reason, :text
  end
end
