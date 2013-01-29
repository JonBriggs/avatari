class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :controller
      t.string :action
      t.integer :individual_id
      t.text :stats

      t.timestamps
    end
  end
end
