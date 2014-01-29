class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|

      t.timestamps
    end
  end
end
