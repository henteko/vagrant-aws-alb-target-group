require_relative 'base'

module VagrantPlugins
  module AwsAlbTargetGroup
    module Action
      class AddInstance < Base

        def call(env)
          super env do |instance_id, target_group_name|
            @aws.add_instance(instance_id, target_group_name)
            @machine.ui.info("Add instance #{instance_id} to #{target_group_name}.")
          end
        end

      end
    end
  end
end