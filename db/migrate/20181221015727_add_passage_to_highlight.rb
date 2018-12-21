class AddPassageToHighlight < ActiveRecord::Migration
  def change
    add_reference :highlights, :passage, index: true, foreign_key: true
  end
end
