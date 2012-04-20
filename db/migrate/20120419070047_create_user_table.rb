class CreateUserTable < ActiveRecord::Migration
  def up
  	create_table :users do |u|
  		u.string :username, null: false
  		u.string :display_name,  null: false
  		u.string :status, null: false
  		u.integer :media_id
  	end
  end

  def down
  	drop_table :users
  end
end
