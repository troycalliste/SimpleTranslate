class AddNameToDefinitions < ActiveRecord::Migration[5.1]
  def change
    add_column :definitions, :name, :string
  end
end
