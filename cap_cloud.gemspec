# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'cap_cloud/version'

Gem::Specification.new do |gem|
  gem.name          = "cap_cloud"
  gem.version       = "0.0.2"#CapCloud::VERSION
  gem.authors       = ["Jordan Brock"]
  gem.email         = ["jordan@brock.id.au"]
  gem.description   = "Finds EC2 instances based upon tags"
  gem.summary       = "Finds EC2 instances based upon tags" 
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "fog"
end
