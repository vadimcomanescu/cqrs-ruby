class InventoryItemCreated
  
  attr_reader :id, :activated
  
  def initialize id, activated
    @id = id
    @activated = activated
  end
  
end