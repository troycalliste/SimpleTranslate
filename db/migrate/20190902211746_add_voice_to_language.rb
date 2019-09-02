class AddVoiceToLanguage < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :voice, :string, default: "n/a"
  end
end
