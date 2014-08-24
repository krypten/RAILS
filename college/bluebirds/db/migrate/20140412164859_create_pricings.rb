class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.string :seat_type
      t.decimal :price

      t.timestamps
    end
  end
end
