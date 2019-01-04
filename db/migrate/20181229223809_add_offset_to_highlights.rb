class AddOffsetToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :offset, :string
  end
end
