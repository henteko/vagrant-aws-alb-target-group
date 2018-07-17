# vagrant-aws-alb-target-group

A Vagrant plugin setup the ALB Target Group.

## Add instance

* initial `vagrant up`
* `vagrant up` the halted instance

## Remove instance

* `vagrant halt`
* `vagrant destroy`

## Prerequisite

* vagrant-aws

## Install

```zsh
$ vagrant install vagrant-aws-alb-target-group
```

## Config

```ruby
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box       = 'dummy'
  config.ssh.username = 'henteko'

  config.vm.provider :aws do |aws, override|
    aws.ami                       = 'ami'
    aws.access_key_id             = 'key_id'
    aws.secret_access_key         = 'secret_key'
    aws.region                    = 'ap-northeast-1'
    aws.instance_type             = 't2.medium'

    override.aws_alb.target_group_name = 'your-target-group-name'
  end

end
```