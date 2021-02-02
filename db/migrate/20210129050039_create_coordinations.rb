class CreateCoordinations < ActiveRecord::Migration[6.0]
  def change
    create_table :coordinations do |t|
      t.string     :coordination_title,  null: false
      t.text       :coordination_profile
      t.integer    :item_id,             null: false
      t.string     :item_text,           null: false
      t.references :user,                null: false, foreign_key: true

      t.timestamps
    end
  end
end
