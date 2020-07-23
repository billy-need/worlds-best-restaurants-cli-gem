require_relative './lib/top_100_movies/version'

Gem::Specification.new do |s|
  s.name        = 'top_100_movies'
  s.version     = top100movies::VERSION
  s.date        = '2016-01-13'
  s.summary     = "Best movies in history"
  s.description = "Provides details on the internet movie database's top 100 movies"
  s.authors     = ["Billy Needrith"]
  s.email       = 'billy.needrith@gmail.com'
  s.files       = ["lib/top_100_movies.rb", "lib/top_100_movies/cli.rb", "lib/top_100_movies/scraper.rb", "lib/top_100_movies.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/top_100_movies'
  s.license     = 'MIT'
  s.executables << 'top_100_movies'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end