module Highrise
  class Lead
    
    TASK_CATEGORY_ID_QUALIFY_LEAD = 3318802
    
    def self.create(lead    = {})
        person              = Highrise::Person.new
        person.first_name   = lead[:firstname]
        person.last_name    = lead[:lastname]
        person.save!         
                             
        task                = Highrise::Task.new
        task.body           = "Lead von #{lead[:firstname]} #{lead[:lastname]} qualifizieren"
        task.author_id      = lead[:responsible_user_id]
        task.owner_id       = lead[:responsible_user_id]
        task.category_id    = TASK_CATEGORY_ID_QUALIFY_LEAD
        task.subject_type   = "Party"
        task.subject_id     = person.id                         
        task.save!
        
        lead[:tags].each do |tag|
          person.post(:tags, :name => tag)
        end
    end
  end
end