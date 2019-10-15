class AddUserToEncryptedMemos < ActiveRecord::Migration[6.0]
  def change
    add_reference :encrypted_memos, :user, null: true, foreign_key: true
  end
end
