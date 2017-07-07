class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :project, foreign_key: true
      t.string :file, null: false
      t.text :description
      t.datetime :taken_at
      t.timestamps
    end
  end
end
