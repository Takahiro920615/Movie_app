class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :img
      t.string :title
      t.time :screentime
      t.string :directer
      t.text :detail
      t.text :impression
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
