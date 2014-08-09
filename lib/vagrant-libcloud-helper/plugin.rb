require "vagrant"

module VagrantPlugins
  module LibcloudHelper
    class Plugin < Vagrant.plugin("2")

      include Vagrant::Action::Builtin

      require_relative "action"
      require_relative "providers/virtualbox/driver/base"
      require_relative "providers/virtualbox/driver/meta"

      name "libcloud_helper"

      config "libcloud_helper" do
        require_relative "config"
        Config
      end

      action_hook(:libcloud_helper, :machine_action_up) do |hook|
        hook.after VagrantPlugins::ProviderVirtualBox::Action::Customize,
                   VagrantPlugins::LibcloudHelper::Action.allocate_sata_ports
      end
    end
  end
end
