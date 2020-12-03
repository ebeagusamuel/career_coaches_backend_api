class AddImagePathToCoaches < ActiveRecord::Migration[6.0]
  def change
    add_column :coaches, :image_path, :string
  end
end
