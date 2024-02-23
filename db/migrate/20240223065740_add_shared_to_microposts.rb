class AddSharedToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :shared, :boolean, default: false
  end
end
