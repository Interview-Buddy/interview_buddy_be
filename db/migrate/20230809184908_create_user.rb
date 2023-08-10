class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :company
      t.string :pronouns
      t.string :email
      t.string :password
      t.integer :user_type

      t.timestamps
    end
  end
end
