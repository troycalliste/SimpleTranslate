class CreateDefinitions < ActiveRecord::Migration[5.1]
  def change
    create_table :definitions do |t|
      t.belongs_to :reference

      t.timestamps
    end
  end
end
