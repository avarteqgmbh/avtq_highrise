module Highrise
  class Lead
    
    TASK_CATEGORY_ID_QUALIFY_LEAD = 3318802
    
    def self.create(lead = {})              
      
      #TODO With a little refactoring it's possible to shrink this to:
      # Highrise::Person.new(lead["person"])
      person = Highrise::Person.new(
        "first_name"    => lead["firstname"], 
        "last_name"     => lead["lastname"],
        "contact_data"  => {"email_addresses" => [{"address" => lead["email"], "location" => "Work"}]}
      )
      person.save!         
      
      task                = Highrise::Task.new
      task.body           = "Lead von #{person.first_name} #{person.last_name} qualifizieren"
      task.author_id      = lead["author_user_id"]
      task.owner_id       = lead["responsible_user_id"]
      task.category_id    = TASK_CATEGORY_ID_QUALIFY_LEAD
      task.subject_type   = "Party"
      task.subject_id     = person.id     
      task.notify         = true                    
      task.save!
      
      #TODO message
      unless lead["body"].empty? then
        note = Highrise::Note.new
        note.body           = lead["body"]
        note.subject_type   = "Party"
        note.subject_id     = person.id
        note.save!
      end
      
      lead["tags"].each do |tag|
        person.post(:tags, :name => tag)
      end
    end
    
    def self.create_async(p = {})
      
      p["rabbitmq"] ||= { "host" => "127.0.0.1" }
      p["lead"] ||= {}   
      
      EventMachine.run do
        connection = AMQP.connect(p["rabbitmq"])

        channel  = AMQP::Channel.new(connection)
        queue    = channel.queue('highrise_queue', :durable => true)
        exchange = channel.direct("")

        message = p["lead"].to_json
    
        exchange.publish(message, :routing_key => queue.name, :persistent => true)
          
        # Disconnect & exit after 0.5 seconds
        EventMachine.add_timer(0.5) do
          exchange.delete
          connection.close { EventMachine.stop }
        end
      end
    end
  end
end