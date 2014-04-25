module Qwubble
  class Goliath < Goliath::API
    use ::Goliath::Rack::Params
    use ::Goliath::Rack::Render

    def response(env)
      Qwubble::Grape.call(env)
    end
  end
end
