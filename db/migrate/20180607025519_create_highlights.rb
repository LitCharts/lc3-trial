class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.integer :lit_guide_id, null: false, index: true
      t.text :note
      t.text :quote, null: false
      t.integer :start_position
      t.integer :end_position

      t.timestamps null: false
    end
  end
end
