class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :customer_id
      t.string :event_code
      t.string :event_id
      t.timestamp :timestamp

      t.timestamps
    end
  end
end
