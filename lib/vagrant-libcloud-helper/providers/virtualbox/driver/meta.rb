module VagrantPlugins
  module ProviderVirtualBox
    module Driver

      class Meta

          def_delegators :@driver,
            :allocate_sata_ports

      end
    end
  end
end
