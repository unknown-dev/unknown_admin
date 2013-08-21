require 'rails'

module UnknownAdmin
  class UnknownAdminEngine < ::Rails::Engine
    config.unknown_admin = UnknownAdmin
    require "inherited_resources"
    require "has_scope"
    #require "bootstrap-will_paginate"
    require "will_paginate"
    require "ransack"
    require "simple_form"
    #require "strong_parameters"
  end
end
