class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.references :Movie, index: true
      t.belongs_to :AudiInfo, index: true
      t.time :timing

      t.timestamps
    end
  end
end
