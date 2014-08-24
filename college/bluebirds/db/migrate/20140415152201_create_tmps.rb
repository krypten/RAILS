class CreateTmps < ActiveRecord::Migration
  def change
    create_table :tmps do |t|
      t.string :k
      t.string :h

      t.timestamps
    end
  end
end
