module VagrantPlugins
  module LibcloudHelper
    class Config < Vagrant.plugin("2", :config)

      attr_accessor :enabled

      alias_method :enabled?, :enabled

      def initialize
        @enabled = UNSET_VALUE
      end

      def finalize!
        @enabled = false if @enabled == UNSET_VALUE
      end

      def validate(machine)
        {}
      end
    end
  end
end
