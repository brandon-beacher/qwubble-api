module Qwubble
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::Qwubble::Ping
  end
end
