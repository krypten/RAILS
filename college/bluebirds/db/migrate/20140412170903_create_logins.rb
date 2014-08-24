class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.belongs_to :User, index: true

      t.timestamps
    end
  end
end
