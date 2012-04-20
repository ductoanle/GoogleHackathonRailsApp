class User < ActiveRecord::Base
	attr_accessible :username, :display_name, :status, :media_id
	validates_presence_of :username, :display_name, :status
	validates_uniqueness_of :username
end