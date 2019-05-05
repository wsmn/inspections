class RemoveFileFieldFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column(:images, :file, :string, null: false)
  end
end
