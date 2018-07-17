require 'aws-sdk'
require_relative '../util/aws_util'

module VagrantPlugins
  module AwsAlbTargetGroup
    module Action
      class Base

        def initialize(app, env)
          @app = app
          @machine = env[:machine]
        end

        def call(env)
          return @app.call(env) if @machine.config.aws_alb.target_group_name.nil?

          @aws = AwsAlbTargetGroup::Util::AwsUtil.new(@machine.provider_config.access_key_id,
                                           @machine.provider_config.secret_access_key,
                                           @machine.provider_config.region)
          yield @machine.id, @machine.config.aws_alb.target_group_name if block_given?

          @app.call(env)
        end

      end
    end
  end
end