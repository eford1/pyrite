class CreateSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons do |t|
      t.references :bachelor, foreign_key: { to_table: :people }
      t.string :name

      t.timestamps
    end
  end
end
