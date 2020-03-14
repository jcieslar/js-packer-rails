
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "js/packer/rails/version"

Gem::Specification.new do |spec|
  spec.name          = "js-packer-rails"
  spec.version       = Js::Packer::Rails::VERSION
  spec.authors       = ["Jakub Cieslar"]
  spec.email         = ["cieslar.jakub@gmail.com"]

  spec.summary       = %q{The Packer allows you to easily include JavaScript bundle into your Rails project. You do not need webpacker!}
  spec.description   = %q{The Packer allows you to easily include JavaScript bundle into your Rails project. Use whatever tool you want for build your JS assets. You do not need webpacker gem! (just use Webpack)}
  spec.homepage      = "https://github.com/jcieslar/js-packer-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 5.2"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rails", "~> 5.2"
end
