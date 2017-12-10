class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating
      t.integer :user_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
