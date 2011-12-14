class InventoryItem < AggregateRoot
  
  def initialize id, activated
    super()
    apply_change(InventoryItemCreated.new id, activated)
  end
  
  def deactivate
    apply_change(InventoryItemDeactivated.new @id)
  end
  
  protected
  def apply_InventoryItemDeactivated event
    @activated = false
  end
  
  def apply_InventoryItemCreated event
    @id = event.id
    @activated = event.activated
  end
  
end
