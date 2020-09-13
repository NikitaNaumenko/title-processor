# frozen_string_literal: true

require_relative 'lib/title/processor/version'

Gem::Specification.new do |spec|
  spec.name          = 'title-processor'
  spec.version       = Title::Processor::VERSION
  spec.authors       = ['Nikita Naumenko']
  spec.email         = ['naumenkoniki@gmail.com']

  spec.summary       = 'Get response and parse title'
  spec.description   = 'Go through file and parse each other title response'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
end
