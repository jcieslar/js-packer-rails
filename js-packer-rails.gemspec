
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "js/packer/rails/version"

Gem::Specification.new do |spec|
  spec.name          = "js-packer-rails"
  spec.version       = Js::Packer::Rails::VERSION
  spec.authors       = ["Jakub Cieslar"]
  spec.email         = ["cieslar.jakub@gmail.com"]

  spec.summary       = %q{Pack your JS bundle into Rails app! Use whatever tool you want for your JS assets}
  spec.description   = %q{Pack your JS bundle into Rails app! Use whatever tool you want for your JS assets}
  spec.homepage      = "https://github.com/jcieslar/js-packer-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 4.0.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", ">= 4.0.1"
end
