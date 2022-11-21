class RenameUserIdToAuthorIdInTransacts < ActiveRecord::Migration[7.0]
  def change
    rename_column :transacts, :user_id, :author_id
  end
end
