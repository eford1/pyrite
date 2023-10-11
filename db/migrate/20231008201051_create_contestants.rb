class CreateContestants < ActiveRecord::Migration[7.1]
  def change
    create_table :contestants do |t|
      t.belongs_to :person
      t.integer :age
      
      t.timestamps
    end
  end
end
