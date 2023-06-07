class CreateJoinTableCategoriesTransacts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :transacts do |t|
      t.index [:category_id, :transact_id]
      t.index [:transact_id, :category_id]
    end
  end
end
