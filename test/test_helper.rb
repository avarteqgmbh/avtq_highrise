require 'minitest/autorun'

require File.join(File.dirname(__FILE__), "..", "lib", "avtq_highrise")

puts "\n\nWARNING: NO SITE ENV VARIABLE GIVEN. How should I know where to connect to?\nTry to invoke your tests like this:\n SITE='https://yourapikey:X@yoursite.highrisehq.com' bundle exec rake\n\n" unless ENV["SITE"]

