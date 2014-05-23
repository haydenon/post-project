class Events
  def self.get_events_num (time)
    events = Event.where("created_at <= ?", time)
    return events.size
  end
end