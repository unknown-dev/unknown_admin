require 'rails'

module UnknownAdmin
  class UnknownAdminEngine < ::Rails::Engine
    config.unknown_admin = UnknownAdmin
    require "inherited_resources"
    require "has_scope"
    require "twitter-bootstrap-rails"
    require "bootstrap-datepicker-rails"
    require "bootstrap-will_paginate"
    require "will_paginate"
    require "chosen-rails"
    require "ransack"
  end
end
