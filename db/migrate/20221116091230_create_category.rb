class CreateCategory < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon
      t.float :total_amount, default: 0.0

      t.timestamps
    end
  end
end
