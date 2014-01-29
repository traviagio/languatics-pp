class CreateJoinTableFavPost < ActiveRecord::Migration
  def change
    create_join_table :favs, :posts do |t|
      # t.index [:fav_id, :post_id]
      # t.index [:post_id, :fav_id]
    end
  end
end
