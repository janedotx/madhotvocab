class AddBundleIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :bundle_id, :integer
  end
end
