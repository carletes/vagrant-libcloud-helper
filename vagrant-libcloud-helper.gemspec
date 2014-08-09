# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-libcloud-helper/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-libcloud-helper"
  spec.version       = VagrantPlugins::LibcloudHelper::VERSION
  spec.authors       = ["Carlos Valiente"]
  spec.email         = ["carlos@pepelabs.net"]
  spec.description   = "A Vagrant plugin used by libcloud-vagrant"
  spec.summary       = "This plugins performs low-level changes to the life-cycle of Virtualbox guests"
  spec.homepage      = "https://github.com/carletes/vagrant-libcloud-helper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = "lib"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
