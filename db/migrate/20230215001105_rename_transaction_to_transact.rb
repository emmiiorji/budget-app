class RenameTransactionToTransact < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :transacts
  end
end
