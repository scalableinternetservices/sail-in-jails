class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :desc
      t.integer :course

      t.timestamps
    end
  end
end
