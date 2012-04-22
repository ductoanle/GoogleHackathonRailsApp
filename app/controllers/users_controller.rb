class UsersController < ApplicationController
  before_filter :get_user, only: [:show, :update ]

  USER_ATTRIBUTES = ['username', 'display_name', 'status', 'media_id']

	def index
		@users = User.all
    respond_to do |format|
      format.json
    end
	end

	def create
    attrs =  USER_ATTRIBUTES.find_all{|a| params.has_key? a}.each_with_object({ }) { |k,o| o[k.underscore.to_sym] = params[k] }
		user =  User.create(attrs)
		redirect_to user_path(:id => user.id)
  end

  def find_user
    username = params[:username]
    render :text => "-1" unless username.present? && User.find_by_username(username).present?
    render :text => "#{User.find_by_username(username).id}"
  end

	def show
    respond_to do |format|
      format.json
    end
	end

	def update
    if @user.present?
      attrs = USER_ATTRIBUTES.find_all{|a| params.has_key? a}.each_with_object({ }) { |k,o| o[k.underscore.to_sym] = params[k] }
      @user.update_attributes(attrs)
      render :text => 'true'
    else
      redirect_to users_path
    end
  end

  private
  def get_user
    @user = User.find(params[:id]) if (params.present? && params[:id].present?)
  end
end