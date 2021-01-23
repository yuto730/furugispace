class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :notice_title,       null:false
      t.string :notice_display,     null:false
      t.string :notice_heading,     null:false
      t.text   :notice_description, null:false

      t.timestamps
    end
  end
end
