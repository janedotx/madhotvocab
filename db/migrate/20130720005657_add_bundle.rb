class AddBundle < ActiveRecord::Migration
  def up
    create_table :bundles do |t|
      t.timestamps
    end

    create_table :users do |t|
      t.timestamps
    end
  end

  def down
  end
end
