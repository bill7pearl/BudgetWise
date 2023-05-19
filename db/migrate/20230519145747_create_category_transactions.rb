class CreateCategoryTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transactions do |t|

      t.timestamps
    end
  end
end
