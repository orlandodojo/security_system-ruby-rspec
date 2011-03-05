class User
  
  attr_reader :permission
  
  def initialize(params={})
    @access = params[:access]
    @permission = params[:permission]
  end
  
  def has_access?
    SecurityLogger.log_event(:name=>"blah")
    @access
  end


end

class SecurityLogger
  
  def initialize()

  end
  
  def self.log_event(args={})
    @event = args[:access]    
  end

  
end

module Security
  class Elevator
    attr_reader :locked
    
    def self.validate(user, current_time)
      return true if current_time=="business hours"
      user.permission
    end
  end
  
  class Alarm
    

    def self.lockdown
    end
  end
end

