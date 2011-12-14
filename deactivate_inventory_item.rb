class DeactivateInventoryItem < Command
  
  attr_reader :inventory_item_id, :original_version
  
	def initialize inventory_item_id, original_version
	  @inventory_item_id = inventory_item_id
	  @original_version = original_version
	end
	
end