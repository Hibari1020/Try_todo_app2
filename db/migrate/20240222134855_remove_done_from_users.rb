class RemoveDoneFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :done, :boolean
  end
end
