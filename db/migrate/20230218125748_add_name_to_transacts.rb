class AddNameToTransacts < ActiveRecord::Migration[7.0]
  def change
    add_column :transacts, :name, :string
  end
end
