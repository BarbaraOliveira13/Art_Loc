class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :content
      t.float :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
