class CreateBillingInfos < ActiveRecord::Migration
  def change
    create_table :billing_infos do |t|
      t.date :bill_date
      t.belongs_to :CardInfo, index: true

      t.timestamps
    end
  end
end
