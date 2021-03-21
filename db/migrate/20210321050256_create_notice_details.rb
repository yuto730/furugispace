class CreateNoticeDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :notice_details do |t|
      t.references :notice,             null: false, foreign_key: true
      t.string     :notice_heading,     null: false
      t.text       :notice_description, null: false

      t.timestamps
    end
  end
end
