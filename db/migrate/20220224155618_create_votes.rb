class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.boolean :is_slot
      t.datetime :date
      t.datetime :slot_start
      t.datetime :slot_end
      t.integer :temp_user_id
      t.string :temp_user_token
      t.string :temp_user_name
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
