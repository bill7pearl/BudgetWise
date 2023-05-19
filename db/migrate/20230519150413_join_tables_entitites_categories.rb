class JoinTablesEntititesCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :entities, :categories do |t|
      t.index [:entity_id, :category_id]
      t.index [:category_id, :entity_id]
  end
end
end