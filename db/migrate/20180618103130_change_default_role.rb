class ChangeDefaultRole < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :role, :integer, default: 1
  end

  def down
    change_column :users, :role, :integer, default: 2
  end
end
