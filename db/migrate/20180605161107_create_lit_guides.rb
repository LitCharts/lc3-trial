class CreateLitGuides < ActiveRecord::Migration
  def change
    create_table :lit_guides do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
