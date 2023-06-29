class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :date_time
      t.string :student
      t.string :alum
      t.string :link

      t.timestamps
    end
  end
end
