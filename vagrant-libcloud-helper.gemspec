# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-libcloud-helper/version'

Gem::Specification.new do |s|
  s.name          = "vagrant-libcloud-helper"
  s.version       = VagrantPlugins::LibcloudHelper::VERSION
  s.authors       = ["Carlos Valiente"]
  s.email         = ["carlos@pepelabs.net"]
  s.description   = "A Vagrant plugin used by libcloud-vagrant"
  s.summary       = "This plugins performs low-level changes to the life-cycle of Virtualbox guests"
  s.homepage      = "https://github.com/carletes/vagrant-libcloud-helper"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_path  = "lib"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
end
