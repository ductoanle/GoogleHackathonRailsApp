module Girl
  def get_user
  	User.find_by_username('dude')
  end
end