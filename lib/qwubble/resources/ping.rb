module Qwubble
  module Resources
    class Ping < ::Grape::API
      format :json
      get '/ping' do
        one = DB.execute("select 1")
        { ping: "pong" }
      end
    end
  end
end
