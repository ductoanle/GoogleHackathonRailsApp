class Event < ActiveRecord::Base
  attr_accessible :user_id, :channel_id, :media_id, :event_time
  validates_presence_of :user_id, :channel_id, :media_id, :event_time
  belongs_to :user

end