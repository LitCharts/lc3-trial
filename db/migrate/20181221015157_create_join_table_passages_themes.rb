class CreateJoinTablePassagesThemes < ActiveRecord::Migration
  def change
    create_join_table :passages, :themes do |t|
      # t.index [:passage_id, :theme_id]
      # t.index [:theme_id, :passage_id]
    end
  end
end
