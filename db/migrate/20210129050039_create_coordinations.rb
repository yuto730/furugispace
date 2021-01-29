class CreateCoordinations < ActiveRecord::Migration[6.0]
  def change
    create_table :coordinations do |t|
      t.integer    :item_id
      t.string     :item_text
      t.references :store, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
