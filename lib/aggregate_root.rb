class AggregateRoot
  attr_reader :changes
  attr_reader :id
  
  def initialize
    @changes = []
  end
  
  def mark_changes_as_commited
    @changes.clear
  end
  
  def load_from_history history
    history.each {|event| apply_change event, false}
  end
  
  private
  def apply_change event, is_new = true
    message = 'apply_' + event.class.to_s
    raise 'I have no idea what you want from me' unless respond_to? message
    send message, event
    @changes << event if is_new
  end
  
end