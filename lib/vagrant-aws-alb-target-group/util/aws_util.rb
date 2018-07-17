require 'aws-sdk'

module VagrantPlugins
  module AwsAlbTargetGroup
    module Util
      class AwsUtil

        attr_reader :alb

        def initialize(accesskey, secretkey, region)
          credentials = Aws::Credentials.new(accesskey, secretkey)
          @alb = Aws::ElasticLoadBalancingV2::Client.new(
              credentials: credentials,
              region: region
          )
        end

        def add_instance(instance_id, target_group_name)
          @alb.register_targets(
              {
                  target_group_arn: get_target_group_arn(target_group_name),
                  targets: [
                      {
                          id: instance_id,
                      },
                  ],
              }
          )
        end

        def remove_instance(instance_id, target_group_name)
          @alb.deregister_targets(
              {
                  target_group_arn: get_target_group_arn(target_group_name),
                  targets: [
                      {
                          id: instance_id,
                      },
                  ],
              }
          )
        end

        private

        def get_target_group_arn(target_group_name)
          @alb.describe_target_groups({ names: [target_group_name] }).target_groups[0].target_group_arn
        end
      end
    end
  end
end