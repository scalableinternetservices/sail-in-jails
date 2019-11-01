class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :pwd_hash, :password_digest
  end
end
