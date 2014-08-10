module VagrantPlugins
  module LibcloudHelper
    class Config < Vagrant.plugin("2", :config)

      attr_accessor :allocate_sata_ports

      alias_method :allocate_sata_ports?, :allocate_sata_ports

      def initialize
        @allocate_sata_ports = UNSET_VALUE
      end

      def finalize!
        @allocate_sata_ports = false if @allocate_sata_ports == UNSET_VALUE
      end

      def validate(machine)
        {}
      end
    end
  end
end
