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

### Make sure all Rails4 dependencies are met:

    ## RAILS4 Dependencies
		gem "bootstrap-sass",github:"thomas-mcdonald/bootstrap-sass",branch:"3"
		gem "inherited_resources",github:"josevalim/inherited_resources",branch:"master"
		gem "simple_form",github:"plataformatec/simple_form",branch:"master"
		gem "has_scope",github:"plataformatec/has_scope",branch:"master"
		gem "ransack", :git => "git://github.com/ernie/ransack.git", :branch => 'rails-4'
		## END RAILS4 Dependencies

### Add the `unknown-admin` gem

    gem "unknown_admin",github:"unknown-dev/unknown_admin",branch:"rails4"

## Installation

Run `bundle install` from the command line:

    bundle install

It is possible that v8 engine libraries need to be installed

    brew install v8

Also run the unknown_admin generator to install the asset files for the admin-backend

    rails generate unknown_admin:install

You can generate an admin controller by using... model must exist for this to work!

    rails g unknown_admin:controller ModelName

If you do want to add your routes manually, use this:

    rails g unknown_admin:controller ModelName --skip-routes
