class CreateCardInfos < ActiveRecord::Migration
  def change
    create_table :card_infos do |t|
      t.string :card_no
      t.string :card_holdername
      t.date :card_exp_date
      t.integer :card_pin

      t.timestamps
    end
  end
end
