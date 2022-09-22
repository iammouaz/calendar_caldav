class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.string :location
      t.string :uid
      t.references :calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
