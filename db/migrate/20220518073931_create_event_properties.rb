class CreateEventProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :event_properties do |t|
      t.string :custom_property
      t.string :other_property
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
