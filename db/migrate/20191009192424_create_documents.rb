class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :attachable, polymorphic: true, null: false
      t.string :token
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :documents, :token, unique: true
  end
end
