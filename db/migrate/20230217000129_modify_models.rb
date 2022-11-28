class ModifyModels < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :full_name, :first_name

    add_column :users, :last_name, :string
    add_belongs_to :categories, :user, foreign_key: true
  end
end
