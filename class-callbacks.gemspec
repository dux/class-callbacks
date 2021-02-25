version  = File.read File.expand_path '.version', File.dirname(__FILE__)
gem_name = 'class-callbacks'

Gem::Specification.new gem_name, version do |gem|
  gem.summary     = 'Class callbacks allow creation of ruby class methods that can capture blocks and params'
  gem.description = 'Class ancestors are taken in consideration.'
  gem.authors     = ["Dino Reic"]
  gem.email       = 'reic.dino@gmail.com'
  gem.files       = Dir['./lib/**/*.rb']+['./.version']
  gem.homepage    = 'https://github.com/dux/%s' % gem_name
  gem.license     = 'MIT'
end
