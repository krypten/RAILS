class CreateAudiInfos < ActiveRecord::Migration
  def change
    create_table :audi_infos do |t|
      t.integer :screen_no
      t.string :seat_no
      t.belongs_to :Pricing, index: true

      t.timestamps
    end
  end
end
