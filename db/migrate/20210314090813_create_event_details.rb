class CreateEventDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :event_details do |t|
      t.references :event,             null: false, foreign_key: true
      t.string     :event_heading,     null: false
      t.text       :event_description, null: false

      t.timestamps
    end
  end
end
