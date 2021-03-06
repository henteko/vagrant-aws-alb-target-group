lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant-aws-alb-target-group/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-aws-alb-target-group"
  spec.version       = Vagrant::AwsAlbTargetGroup::VERSION
  spec.authors       = ["henteko"]
  spec.email         = ["henteko07@gmail.com"]

  spec.summary       = %q{Setup AWS ALB Target Group}
  spec.description   = %q{Setup AWS ALB Target Group}
  spec.homepage      = "https://github.com/henteko/vagrant-aws-alb-target-group"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'aws-sdk', '~> 2.6.44'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
