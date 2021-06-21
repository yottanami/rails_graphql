
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_graphql/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_graphql"
  spec.version       = RailsGraphql::VERSION
  spec.authors       = ["yottanami"]
  spec.email         = ["yottanami@gnu.org"]

  spec.summary       = "Generate GraphQL using models"
  spec.description   = "Generate GraphQL using models"
  spec.homepage      = "https://github.com/yottanami/rails_graphql"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  # Gem Dependencies
  spec.add_development_dependency "graphiql-rails", "~> 1.7"

  spec.add_dependency "apollo_upload_server", "~> 2.0.0.beta.1"
  spec.add_dependency "graphql", "~> 1.7"
  spec.add_dependency "devise", "~> 4.6"
end
