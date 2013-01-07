$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "unknown_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "unknown_admin"
  s.version     = UnknownAdmin::VERSION
  s.authors     = ["Stefan Kahlert","Dirk Dresch"]
  s.email       = ["kahlert@unknown.de","dresch@unknown.de"]
  s.homepage    = "http://www.unknown.de"
  s.summary     = "TODO: Summary of UnknownAdmin."
  s.description = "TODO: Description of UnknownAdmin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"


  #inherited resources
  s.add_dependency('inherited_resources', '~> 1.3')
  s.add_dependency('has_scope', '~> 0.5.0')
  #bootstrap suoppirt
  ####remove as soon as bootstrap is fixed under rails>=3.2.9
  s.add_dependency('less-rails')
  s.add_dependency('therubyracer')
  ###########
  s.add_dependency('twitter-bootstrap-rails', '~> 2.1')
  s.add_dependency('bootstrap-datepicker-rails', '~> 0.6')
  s.add_dependency('bootstrap-will_paginate', '~> 0.0.9')
  s.add_dependency('will_paginate', '~> 3.0')

  # token field support
  #gem.add_dependency('jquery-rails', '~> 2.1')
  s.add_dependency('chosen-rails', '~> 0.9')

  #search forms
  s.add_dependency("ransack", '~> 0.7.0')

  #simple forms
  s.add_dependency("simple_form",'~> 2.0')
end
