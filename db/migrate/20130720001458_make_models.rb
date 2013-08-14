class MakeModels < ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.string :headword
      t.string :conjugates
      t.timestamps
    end

    create_table :sentences do |t|
      t.integer :word_id
      t.string :part_1
      t.string :part_2
      t.timestamps
    end

    create_table :analogies do |t|
      t.integer :word_id
      t.string :root
      t.string :root_target
      t.string :second_source
      t.string :second_target
      t.timestamps
    end
  end

  def down
    drop_table :words
    drop_table :sentences
    drop_table :analogies
  end
end
