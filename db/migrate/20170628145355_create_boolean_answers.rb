class CreateBooleanAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :boolean_answers do |t|
      t.boolean :answer, null: false, default: false

      t.timestamps
    end
  end
end
