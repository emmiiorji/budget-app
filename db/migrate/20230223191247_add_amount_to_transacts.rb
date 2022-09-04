class AddAmountToTransacts < ActiveRecord::Migration[7.0]
  def change
    add_column :transacts, :amount, :float
  end
end
