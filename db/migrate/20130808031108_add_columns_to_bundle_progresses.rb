class AddColumnsToBundleProgresses < ActiveRecord::Migration
  def change
    create_table :bundle_progresses do |t|
      t.integer :user_id
      t.integer :current_stage
      t.binary :words_seen
      t.binary :words_not_yet_seen
      t.timestamps
    end
  end
end
