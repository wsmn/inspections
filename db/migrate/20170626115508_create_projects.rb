class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :customer, foreign_key: true
      t.string :title
      t.text :description
      t.integer :status, null: false, default: 0, index: true
      t.timestamps
    end
  end
end
