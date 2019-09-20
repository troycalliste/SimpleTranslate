class AddTranslationToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :translation, :text
  end
end
