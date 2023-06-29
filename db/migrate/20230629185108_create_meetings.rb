class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.time :start_time
      t.time :end_time
      t.string :interview_type
      t.string :student
      t.string :alum
      t.date :date

      t.timestamps
    end
  end
end
