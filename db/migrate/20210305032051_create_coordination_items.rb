class CreateCoordinationItems < ActiveRecord::Migration[6.0]
  def change
    create_table :coordination_items do |t|
      t.references :coordination, null: false, foreign_key: true
      t.integer    :item_id,      null: false
      t.string     :item_text,    null: false

      t.timestamps
    end
  end
end
