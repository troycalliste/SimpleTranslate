class AddNameToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :name, :string
  end
end
