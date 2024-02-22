class AddDoneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :done, :boolean, default: false
  end
end
