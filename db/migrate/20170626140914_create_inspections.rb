class CreateInspections < ActiveRecord::Migration[5.1]
  def change
    create_table :inspections do |t|
      t.references :project, foreign_key: true, index: true, null: false
      t.date :on, null: false
      t.integer :kind, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
