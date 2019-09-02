class AddNameToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :name, :string
    add_column :languages, :code, :string
  end
end
