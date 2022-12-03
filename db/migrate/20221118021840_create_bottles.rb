class CreateBottles < ActiveRecord::Migration[6.1]
  def change
    create_table :bottles do |t|
      t.string :title
      t.string :wine_type
      t.string :grape_variety
      t.integer :vintage
      t.references :user, null: false, foreign_key: true, index: true
      t.references :winery, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
