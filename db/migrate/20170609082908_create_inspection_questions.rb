class CreateInspectionQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :inspection_questions do |t|
      t.references :inspection, foreign_key: true, index: true, null: false
      t.references :question, foreign_key: true, index: true, null: false
      t.integer :position, null: false, default: 0
      t.text :answer
      t.timestamps
    end
  end
end
