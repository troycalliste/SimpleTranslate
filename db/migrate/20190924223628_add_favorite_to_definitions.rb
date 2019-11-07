class AddFavoriteToDefinitions < ActiveRecord::Migration[5.1]
  def change
    add_reference :definitions, :favorite, foreign_key: true
  end
end
