require 'dotenv'; Dotenv.load
require "em-gcm"
require "em-pg-sequel"
require "em-synchrony"
require "em-synchrony/em-http"
require "goliath"
require "grape"
require "sequel"

Sequel::Model.plugin :json_serializer
DB = ::Sequel.connect(
  ENV["DATABASE_URL"],
  pool_class: :em_synchrony)

GCM = EM::GCM::Client.new(ENV["GCM_API_KEY"])

Bundler.require :default

require "qwubble/models/answer"
require "qwubble/models/question"
require "qwubble/models/registration"
require "qwubble/notifications/notification"
require "qwubble/notifications/answer_creation_notification"
require "qwubble/notifications/question_creation_notification"
require "qwubble/resources/answers"
require "qwubble/resources/ping"
require "qwubble/resources/questions"
require "qwubble/resources/registrations"
require "qwubble/searches/google_image_search"
require "qwubble/goliath"
require "qwubble/grape"
