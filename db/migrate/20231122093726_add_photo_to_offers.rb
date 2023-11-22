class AddPhotoToOffers < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :photo, :string
  end
end
