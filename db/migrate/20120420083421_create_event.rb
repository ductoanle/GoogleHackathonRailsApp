class CreateEvent < ActiveRecord::Migration
  def up
    create_table :events do |e|
      e.integer :user_id, :null => false
      e.integer :channel_id, :null => false
      e.integer :media_id, :null => false
      e.integer :event_time, :null => false, :limit => 8
      e.timestamps
    end
  end

  def down
    drop_table :events
  end
end
