class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.boolean :reserved, default: false
      t.date :date_begin
      t.date :date_end
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
