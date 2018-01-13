
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "toplevel/version"

Gem::Specification.new do |spec|
  spec.name          = "toplevel"
  spec.version       = Toplevel::VERSION
  spec.authors       = ["osyo-manga"]
  spec.email         = ["osyo.manga@gmail.com"]

  spec.summary       = %q{Define toplevel method local.}
  spec.description   = %q{Define toplevel method local.}
  spec.homepage      = "https://github.com/osyo-manga/gem-toplevel"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
