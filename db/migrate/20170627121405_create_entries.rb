class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :inspection, foreign_key: true, index: true, null: false
      t.references :question, foreign_key: true, index: true, null: false
      t.references :answer, polymorphic: true, index: true
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
