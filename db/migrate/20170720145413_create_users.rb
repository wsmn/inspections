class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false, index: true, unique: true
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false, index: true
      t.string :name, null: false
      t.string :phone
      t.integer :role, default: 0, null: false
    end
  end
end
