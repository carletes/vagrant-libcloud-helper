module VagrantPlugins
  module ProviderVirtualBox
    module Driver
      class Base

        def allocate_sata_ports
          controller = get_sata_controller_name
          portcount = 30
          if controller.nil?
            controller = "SATA Controller"
            @logger.info("****** Creating SATA controller '#{controller}' with #{portcount} ports")
            execute("storagectl", @uuid, "--name", controller, "--portcount", portcount.to_s, "--add", "sata")
          else
            @logger.info("****** Allocating #{portcount} ports in  SATA controller '#{controller}'")
            execute("storagectl", @uuid, "--name", controller, "--portcount", portcount.to_s)
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
