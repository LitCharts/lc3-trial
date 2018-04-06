class AddInitialSchema < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.timestamps null: false
    end

    add_foreign_key :books, :authors

    create_table :themes do |t|
      t.string :title
      t.text :description
      t.integer :book_id

      t.timestamps null: false
    end

    add_foreign_key :themes, :books
  end
end
