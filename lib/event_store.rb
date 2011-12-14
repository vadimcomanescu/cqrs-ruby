class EventStore
		
	def initialize
	  @events = {}
	  @event_data = Struct.new(:event, :aggr_id, :aggr_version)
	end
	
	def save_events aggregate_id, events, expected_version
	  aggregate_events_data = @events[aggregate_id] || []
	  raise "Concurency Exception" if aggregate_events_data.length != expected_version && expected_version != -1
	  @events[aggregate_id] = aggregate_events_data + new_event_data_for(aggregate_id, events, expected_version)
	end
	
	def get_events_for_aggregate aggregate_id
	  events_data = @events[aggregate_id]
	  raise "Aggregate not found" unless events_data
	  events_data.collect { |data| data.event }
	end
	
	private 
	def new_event_data_for aggregate_id, events, expected_version
	  new_event_data = []
	  events.each do |event|
	    event.version = expected_version += 1
	    new_event_data << @event_data.new(event, aggregate_id, expected_version)
	  end
	  new_event_data
	end
end


