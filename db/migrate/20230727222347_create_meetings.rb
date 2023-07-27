class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.time :start_time
      t.time :end_time
      t.integer :interview_type
      t.integer :student_id
      t.integer :alum_id
      t.date :date

      t.timestamps
    end
  end
end
