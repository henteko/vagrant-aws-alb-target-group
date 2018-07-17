require_relative 'base'

module VagrantPlugins
  module AwsAlbTargetGroup
    module Action
      class RemoveInstance < Base

        def call(env)
          super env do |instance_id, target_group_name|
            @aws.remove_instance(instance_id, target_group_name)
            @machine.ui.info("Remove instance #{instance_id} to #{target_group_name}.")
          end
        end

      end
    end
  end
end