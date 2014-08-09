module VagrantPlugins
  module ProviderVirtualBox
    module Driver
      class Base

        def allocate_sata_ports
          controller = get_sata_controller_name
          if !controller.nil?
            execute("storagectl", @uuid, "--name", controller, "--portcount", "30")
          end
        end

        def get_sata_controller_name
          controllers = Hash.new
          info = execute("showvminfo", @uuid, "--machinereadable", :retryable => true)
          info.split("\n").each do |line|
            controllers[$1] = $2 if line =~ /^storagecontrollername(\d+)="(.*)"/
            sata_controller_number = $1 if line =~ /^storagecontrollertype(\d+)="IntelAhci"/
            return controllers[sata_controller_number] unless controllers[sata_controller_number].nil?
          end
          return nil
        end

      end
    end
  end
end
