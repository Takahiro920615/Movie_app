class AddlikesTomovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :likes, :boolean, default: false
  end
end
