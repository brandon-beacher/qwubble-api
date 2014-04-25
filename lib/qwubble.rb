require 'dotenv'; Dotenv.load
require "em-pg-sequel"
require "em-synchrony"
require "goliath"
require "grape"
require "sequel"

Sequel::Model.plugin :json_serializer
DB = ::Sequel.connect(
  ENV["DATABASE_URL"],
  pool_class: :em_synchrony)

Bundler.require :default

require "qwubble/models/question"
require "qwubble/models/registration"
require "qwubble/resources/ping"
require "qwubble/resources/questions"
require "qwubble/resources/registrations"
require "qwubble/goliath"
require "qwubble/grape"
