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
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
### Add the `unknown-admin` gem
  gem 'unknown_admin',:git=>"http://gitlab.unknown.de/unknown_admin.git"


## Installation

Run `bundle install` from the command line:

    bundle install

Then run the boostrap generator to add Bootstrap includes into your assets:

    rails generate bootstrap:install less

Also run the unknown_admin generator to install the asset files for the admin-backend

    rails generate unknown_admin:install