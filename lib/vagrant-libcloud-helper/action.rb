require "vagrant/action/builder"
require "vagrant-libcloud-helper/action"

module VagrantPlugins
  module LibcloudHelper
    module Action
      include Vagrant::Action::Builtin

      autoload :AllocateSataPorts,  File.expand_path("../action/allocate_sata_ports.rb", __FILE__)

      def self.allocate_sata_ports
        Vagrant::Action::Builder.new.tap do |builder|
          builder.use ConfigValidate
          builder.use AllocateSataPorts
        end
      end
    end
  end
end
