require 'spec_helper'

describe Qwubble::Resources::Ping do
  it "pings" do
    with_api Qwubble::Goliath do
      get_request(path: "/api/ping") do |async|
        async.response.should == { ping: "pong" }.to_json
      end
    end
  end
end

