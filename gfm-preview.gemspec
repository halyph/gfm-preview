# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gfm-preview/version'

Gem::Specification.new do |gem|
  gem.name          = "gfm-preview"
  gem.version       = GfmPreview::VERSION
  gem.authors       = ["Yusuke Fujiki"]
  gem.email         = ["yusuke@fujikkys.com"]
  gem.description   = %q{GFM (GitHub Flavored Markdown) Preview Server.}
  gem.summary       = %q{GFM Preview Server}
  gem.homepage      = "https://github.com/fujikky/gfm-preview"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "github-markup"
  gem.add_dependency "github-markdown"
end
