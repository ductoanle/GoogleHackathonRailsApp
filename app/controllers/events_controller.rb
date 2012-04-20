class EventsController < ApplicationController
  before_filter :get_event, only: [:show]
  EVENT_ATTRIBUTES = ['user_id', 'channel_id', 'media_id', 'event_time']

  def index
    @events = Event.all
  end

  def create
    attrs =  EVENT_ATTRIBUTES.find_all{|a| params.has_key? a}.each_with_object({ }) { |k,o| o[k.underscore.to_sym] = params[k] }
    event =  Event.create(attrs)
    redirect_to event_path(:id => event.id)
  end

  def show
  end

  private
  def get_event
    @event = Event.find(params[:id]) if params.present? && params[:id].present?
  end
end