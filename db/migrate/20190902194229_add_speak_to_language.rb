class AddSpeakToLanguage < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :speak, :boolean, default: false
  end
end
