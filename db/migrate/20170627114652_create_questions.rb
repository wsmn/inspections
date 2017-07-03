class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.integer :kind, null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
