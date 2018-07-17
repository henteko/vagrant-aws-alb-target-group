require 'vagrant'

module VagrantPlugins
  module AwsAlbTargetGroup
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :target_group_name

      def initialize
        @target_group_name = UNSET_VALUE
      end

      def finalize!
        @target_group_name = nil if @target_group_name == UNSET_VALUE
      end

      def validate(machine)
        finalize!

        errors = _detected_errors

        { 'AwsAlbTargetGroup' => errors }
      end
    end
  end
end