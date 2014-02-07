Bundler.require(:default)

Dotenv.load

# Require actionpack
# require 'abstract_controller'
# require 'action_controller'

# Connect database
require './config/connect_database.rb'

# Autoload app directory
Dir[File.join("./app/helpers**/*.rb")].each {|file| load file } 
Dir[File.join("./app/models**/*.rb")].each {|file| load file }
Dir[File.join("./app/decorators**/*.rb")].each {|file| load file }
load './app/controllers/application_controller.rb'
Dir[File.join("./app/controllers**/*.rb")].each {|file| load file }

