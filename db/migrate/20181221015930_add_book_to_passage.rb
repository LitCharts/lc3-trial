class AddBookToPassage < ActiveRecord::Migration
  def change
    add_reference :passages, :book, index: true, foreign_key: true
  end
end
