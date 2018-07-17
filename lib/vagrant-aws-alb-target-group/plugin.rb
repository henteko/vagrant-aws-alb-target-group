require 'vagrant'

module VagrantPlugins
  module AwsAlbTargetGroup
    class Plugin < Vagrant.plugin('2')
      name 'aws-alb-target-group'

      description <<-DESC
        A Vagrant plugin that allows you to setup ALB Target Group.
      DESC

      config :aws_alb do
        require_relative 'config'
        Config
      end

      action_hook :add_instance, :machine_action_up do |hook|
        require_relative 'action/add_instance'
        hook.after VagrantPlugins::AWS::Action::RunInstance,   VagrantPlugins::AwsAlbTargetGroup::Action::AddInstance
        hook.after VagrantPlugins::AWS::Action::StartInstance, VagrantPlugins::AwsAlbTargetGroup::Action::AddInstance
      end

      action_hook :remove_instance, :machine_action_halt do |hook|
        require_relative 'action/remove_instance'
        hook.after VagrantPlugins::AWS::Action::StopInstance,      VagrantPlugins::AwsAlbTargetGroup::Action::RemoveInstance
        hook.after VagrantPlugins::AWS::Action::TerminateInstance, VagrantPlugins::AwsAlbTargetGroup::Action::RemoveInstance
      end

      action_hook :remove_instance, :machine_action_destroy do |hook|
        require_relative 'action/remove_instance'
        hook.before VagrantPlugins::AWS::Action::StopInstance,      VagrantPlugins::AwsAlbTargetGroup::Action::RemoveInstance
        hook.before VagrantPlugins::AWS::Action::TerminateInstance, VagrantPlugins::AwsAlbTargetGroup::Action::RemoveInstance
      end

      action_hook :add_instance, :machine_action_reload do |hook|
        require_relative 'action/remove_instance'
        hook.after VagrantPlugins::AWS::Action::StopInstance,      VagrantPlugins::AwsAlbTargetGroup::Action::RemoveInstance
        hook.after VagrantPlugins::AWS::Action::TerminateInstance, VagrantPlugins::AwsAlbTargetGroup::Action::RemoveInstance

        require_relative 'action/add_instance'
        hook.after VagrantPlugins::AWS::Action::RunInstance,   VagrantPlugins::AwsAlbTargetGroup::Action::AddInstance
        hook.after VagrantPlugins::AWS::Action::StartInstance, VagrantPlugins::AwsAlbTargetGroup::Action::AddInstance
      end

    end
  end
end