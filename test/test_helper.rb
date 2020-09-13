# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'title/processor'

require 'minitest/autorun'
require 'webmock/minitest'

def read_fixtures(name)
  path = File.expand_path("fixtures/#{name}", __dir__)
  File.read(path).split("\n")
end
