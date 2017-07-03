class CreateTextAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :text_answers do |t|
      t.text :answer

      t.timestamps
    end
  end
end
