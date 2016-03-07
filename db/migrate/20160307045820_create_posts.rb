class CreatePosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|

      t.timestamps null: false
    end
  end
end
