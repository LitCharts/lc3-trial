class CreateJoinTablePassagesLiterarySymbols < ActiveRecord::Migration
  def change
    create_join_table :passages, :literary_symbols do |t|
      # t.index [:passage_id, :literary_symbol_id]
      # t.index [:literary_symbol_id, :passage_id]
    end
  end
end
