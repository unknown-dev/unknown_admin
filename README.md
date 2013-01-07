# unknown? Admin Backend
`unknown-admin` is a basic framework for administration backend purposes. It is heavily based on Bootstrap and inherited_resources.
It is focused on the DRY principle throughout.

Through template inheritance there is hardly more to do, than creating an empty controller for your model.
It completely implements all CRUD methods and provides default views for them.
If you want, you can override a lot, of course.


Enjoy.

## Usage

### Rails

In your Gemfile:

### Required for bootstrap (starting Rails 3.2.9)

    gem "therubyracer"
    gem "less-rails"
    gem "twitter-bootstrap-rails"

### Add the `unknown-admin` gem

    gem 'unknown_admin',:git=>"http://gitlab.unknown.de/unknown_admin.git"


## Installation

Run `bundle install` from the command line:

    bundle install

It is possible that v8 engine libraries need to be installed

    brew install v8

Then run the boostrap generator to add Bootstrap includes into your assets:

    rails generate bootstrap:install less

Also run the unknown_admin generator to install the asset files for the admin-backend

    rails generate unknown_admin:install

Add following line to one of your initializers, if you want to use strong parameters

    ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)

You can generate an admin controller by using... model must exist for this to work!

    rails g unknown_admin:controller ModelName

If you do want to add your routes manually, use this:

    rails g unknown_admin:controller ModelName --skip-routes
