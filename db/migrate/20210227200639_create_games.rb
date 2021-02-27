class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :console
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
