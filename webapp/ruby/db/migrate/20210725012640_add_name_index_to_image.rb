class AddNameIndexToImage < ActiveRecord::Migration[5.2]
  def change
    add_index :image, :name
  end
end
