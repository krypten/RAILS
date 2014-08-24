class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :Viewing, index: true
      t.date :show_date
      t.belongs_to :Order, index: true

      t.timestamps
    end
  end
end
