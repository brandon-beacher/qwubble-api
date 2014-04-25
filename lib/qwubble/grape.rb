module Qwubble
  class Grape < Grape::API
    prefix 'api'
    format :json
    mount ::Qwubble::Resources::Ping
    mount ::Qwubble::Resources::Registrations
  end
end
