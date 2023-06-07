class RemoveForeignKeyFromTransacts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :transacts, :category, null: false, foreign_key: true
  end
end
