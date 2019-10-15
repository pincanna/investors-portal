class CreateEncryptedMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :encrypted_memos do |t|
      t.string :uid
      t.string :title
      t.text :encrypted_body
      t.string :encrypted_body_iv

      t.timestamps
    end
    add_index :encrypted_memos, :uid, unique: true
  end
end
