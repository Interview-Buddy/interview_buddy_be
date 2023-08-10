class CreateMeeting < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.time :start_time
      t.time :end_time
      t.date :date
      t.string :title
      t.integer :interview_type
      t.integer :student_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
