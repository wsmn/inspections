class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :kind, null: false, default: 0
      t.integer :category, null: false, default: 0
      t.text :content
      t.timestamps
    end
  end
end
