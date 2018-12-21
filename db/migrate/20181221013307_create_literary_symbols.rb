class CreateLiterarySymbols < ActiveRecord::Migration
  def change
    create_table :literary_symbols do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
