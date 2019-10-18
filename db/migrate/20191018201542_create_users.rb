class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :course
      t.text :bio
      t.integer :team_id
      t.string :pwd_hash

      t.timestamps
    end
  end
end
