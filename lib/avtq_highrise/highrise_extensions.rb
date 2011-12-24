Highrise::Base.class_eval do
  self.format = :xml  
end

module Highrise
  class Deal < Base
  end
  
  class TaskCategory < Base
  end  
  
  class DealCategory < Base
  end
  
  class Tag < Base
  end
end
