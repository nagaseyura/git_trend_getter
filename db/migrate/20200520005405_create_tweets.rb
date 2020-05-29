class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :image
      t.string :product_name
      t.string :price
      t.string :sale
      

      t.timestamps
    end
  end
end
