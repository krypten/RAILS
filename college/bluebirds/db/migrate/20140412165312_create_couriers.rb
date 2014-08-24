class CreateCouriers < ActiveRecord::Migration
  def change
    create_table :couriers do |t|
      t.string :receiver_name
      t.string :contact_no
      t.text :address

      t.timestamps
    end
  end
end
