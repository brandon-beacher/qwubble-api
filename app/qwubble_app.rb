module Qwubble
  class App < Goliath::API
    use Goliath::Rack::Params
    use Goliath::Rack::Render

    def response(env)
      Qwubble::API.call(env)
    end
  end
end
