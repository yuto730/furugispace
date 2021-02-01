class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string     :community_title,   null: false
      t.text       :community_profile, null: false
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
