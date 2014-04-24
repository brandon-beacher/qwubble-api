require 'spec_helper'

describe Qwubble::API do
  it "ping" do
    with_api Qwubble::App do
      get_request(path: "/api/ping") do |async|
        async.response.should == { ping: "pong" }.to_json
      end
    end
  end
end

