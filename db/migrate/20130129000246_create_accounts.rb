class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :individual_id
      t.string :lms_instance
      t.integer :canvas_course_id

      t.timestamps
    end
  end
end
