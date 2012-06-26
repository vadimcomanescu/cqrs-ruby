class Repository
  
  def initialize event_store
    @event_store = event_store
  end
  
  def get_by_id aggr_id
    events = @event_store.get_events_for_aggregate aggr_id
    inventory_item = InventoryItem.new aggr_id, false
    inventory_item.load_from_history events
    return inventory_item
  end
  
  def save aggregate_root, expected_version
    @event_store.save_events aggregate_root.id, aggregate_root.changes, expected_version
  end

end
