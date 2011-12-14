require 'spec_helper'
describe InventoryItem do
  
  context "when being deactivated" do
    before(:each) do
      begin
        @sut = InventoryItem.new 1, true
        @sut.deactivate
        @produced_events = @sut.changes
      rescue Exception => e
        @caught = e
      end
    end
    
    
    it "should finish by being deactivated" do
      @produced_events.last.should be_a_kind_of InventoryItemDeactivated
      @produced_events.last.id.should equal 1
    end
    
    it "should not raise any errors" do
      @caught.should be_nil
    end
  end
end