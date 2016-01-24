$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "falsememories/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "falsememories"
  s.version     = Falsememories::VERSION
  s.authors     = ["Callum Hogg"]
  s.email       = ["bananaCypher@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Falsememories."
  s.description = "TODO: Description of Falsememories."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
