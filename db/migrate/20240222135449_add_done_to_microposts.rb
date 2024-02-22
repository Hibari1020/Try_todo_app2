class AddDoneToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :done, :boolean, default: false
  end
end
