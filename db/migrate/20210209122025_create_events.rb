class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string      :event_title,                       null:false
      t.boolean     :event_display, default: true,     null:false
      t.string      :start_on,                          null:false
      t.text        :end_on,                            null:false
      t.string      :event_heading,                     null:false
      t.text        :event_description,                 null:false
      t.string      :entry_fee,                         null:false
      t.integer     :prefecture_id,                     null:false
      t.string      :event_address,                     null:false
      t.string      :venue,                             null:false
      t.references  :store,                         null: false, foreign_key: true
      t.timestamps
    end
  end
end
