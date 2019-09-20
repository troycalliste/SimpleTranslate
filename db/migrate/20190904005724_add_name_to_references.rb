class AddNameToReferences < ActiveRecord::Migration[5.1]
  def change
    add_column :references, :name, :string
  end
end
