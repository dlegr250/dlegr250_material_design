# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dlegr250_material_design/version'

Gem::Specification.new do |spec|
  spec.name          = "dlegr250_material_design"
  spec.version       = Dlegr250MaterialDesign::VERSION
  spec.authors       = ["Daniel LeGrand"]
  spec.email         = ["dan.legrand@gmail.com"]

  spec.summary       = %q{Customized implementation of Google Material Design User Interface.}
  spec.description   = %q{WARNING: ALPHA CODE, NOT PRODUCTION READY. ACTIVELY UNDER DEVELOPMENT AS OF AUG 2016. Implement Google Material Design spec with modern browsers in mind (aka, do not worry about older IE browers...).}
  spec.homepage      = "http://www.github.com/dlegr250/dlegr250_material_design"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  # spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake", "~> 11.2.2"
  spec.add_development_dependency "rspec"

  # TODO add required dependencies: SASS, jQuery
end
