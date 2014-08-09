module VagrantPlugins
  module LibcloudHelper
    module Action
      class AllocateSataPorts

        def initialize(app, env)
          @app = app
          @machine = env[:machine]
        end

        def call(env)
          return @app.call(env) if @machine.state.id != :poweroff && [:up].include?(env[:machine_action])

          env[:ui].info "********* Allocating SATA ports"
          env[:machine].provider.driver.allocate_sata_ports

          @app.call(env)
        end
      end
    end
  end
end
