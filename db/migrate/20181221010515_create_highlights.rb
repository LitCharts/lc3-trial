class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.text :text
      t.text :note

      t.timestamps null: false
    end
  end
end
