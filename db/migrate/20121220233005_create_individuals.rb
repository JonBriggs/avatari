class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :firstname
      t.string :lastname
      t.integer :canvas_id
      t.string :sisid
      t.string :email
      t.string :type
      t.integer :gradyear

      t.timestamps
    end
  end
end
