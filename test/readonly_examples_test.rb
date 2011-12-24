require 'minitest/autorun'
require File.join(File.pathname(__FILE__), "..", "lib", "avtq_highrise")

class ReadonlyExamplesTest < Test::Unit::TestCase
  def test_list_all_people
    people = Highrise::Person.all

    assert people.size > 0
  end
end