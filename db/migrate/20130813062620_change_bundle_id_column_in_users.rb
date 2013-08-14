class ChangeBundleIdColumnInUsers < ActiveRecord::Migration
  def up
    change_column_default(:users, :bundle_id, 0)
  end

  def down
    change_column_default(:users, :bundle_id, 1)
  end
end
