require 'test_helper'

class ReadonlyExamplesTest < MiniTest::Unit::TestCase
  def test_list_all_people
    people = Highrise::Person.all

    assert people.size > 0
  end
end