require 'test_helper'

class Highrise::LeadTest < MiniTest::Unit::TestCase
  def test_create_lead
  end
  
  def test_create_note
    Highrise::Note.new
  end
  
  def test_create_person_with_contact_data
    person = Highrise::Person.new(
      "first_name"    => "Bert", 
      "last_name"     => "Backenbart",
      "contact_data"  => {"email_addresses" => [{"address" => "me@mo.com", "location" => "Work"}]}
    )
    
    assert_equal("Bert", person.first_name)
    assert_equal("Backenbart", person.last_name)
    assert_respond_to(person, :contact_data)
    assert_instance_of(Highrise::Person::ContactData, person.contact_data)
    assert_respond_to(person.contact_data, :email_addresses)
    assert_equal(person.contact_data.email_addresses.size, 1)
    assert_instance_of(Highrise::Person::ContactData::EmailAddress, person.contact_data.email_addresses.first)
    assert_equal(person.contact_data.email_addresses.first.address, "me@mo.com")    
  end
end