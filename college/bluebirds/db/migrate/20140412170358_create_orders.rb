class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :total_amount
      t.boolean :payment_success
      t.string :mode_of_collection
      t.belongs_to :Courier, index: true
      t.belongs_to :BillingInfo, index: true
      t.belongs_to :User, index: true

      t.timestamps
    end
  end
end
